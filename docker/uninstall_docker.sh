#!/bin/bash

# 定义颜色输出函数
echo_color() {
    case "$1" in
        "green")
            echo -e "\033[32m$2\033[0m"
        ;;
        "red")
            echo -e "\033[31m$2\033[0m"
        ;;
        "yellow")
            echo -e "\033[33m$2\033[0m"
        ;;
        *)
            echo "$2"
        ;;
    esac
}

# 检查是否为root用户
if [ "$(id -u)" != "0" ]; then
    echo_color "red" "错误：请使用root权限运行此脚本"
    exit 1
 fi

# 检测Linux发行版
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    OS=$(uname -s)
fi

# 确认卸载
echo_color "yellow" "警告：此操作将完全卸载Docker及其相关组件，且无法恢复！"
read -p "确定要继续吗？(y/N) " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo_color "green" "操作已取消"
    exit 0
fi

# 备份Docker配置
backup_dir="/tmp/docker_backup_$(date +%Y%m%d_%H%M%S)"
echo_color "green" "正在备份Docker配置到 $backup_dir"
mkdir -p "$backup_dir"
if [ -d "/etc/docker" ]; then
    cp -r /etc/docker "$backup_dir/"
fi

# 停止所有运行中的容器
if command -v docker &> /dev/null; then
    echo_color "green" "停止所有运行中的容器..."
    docker stop $(docker ps -aq) 2>/dev/null || true
fi

# 停止Docker服务
echo_color "green" "停止Docker服务..."
if command -v systemctl &> /dev/null; then
    systemctl stop docker || true
    systemctl stop docker.socket || true
else
    service docker stop || true
fi

# 根据不同的发行版卸载Docker
echo_color "green" "卸载Docker组件..."
case "$OS" in
    "ubuntu"|"debian")
        apt-get remove -y docker docker-engine docker.io containerd runc docker-compose
        apt-get purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
        ;;
    "centos"|"rhel"|"fedora")
        yum remove -y docker docker-client docker-client-latest docker-common \
            docker-latest docker-latest-logrotate docker-logrotate docker-engine \
            docker-ce docker-ce-cli containerd.io docker-compose-plugin
        ;;
    *)
        echo_color "yellow" "未能识别的操作系统，将尝试通用卸载方法"
        ;;
esac

# 删除Docker相关文件和目录
echo_color "green" "清理Docker相关文件和目录..."
dirs_to_remove=(
    "/var/lib/docker"
    "/var/lib/containerd"
    "/etc/docker"
    "$HOME/.docker"
    "/usr/local/bin/docker-compose"
    "/usr/local/bin/docker-machine"
    "/usr/local/bin/docker"
    "/var/cache/docker"
    "/var/log/docker"
    "/etc/default/docker"
    "/etc/systemd/system/docker.service.d"
)

for dir in "${dirs_to_remove[@]}"; do
    if [ -e "$dir" ]; then
        rm -rf "$dir" && echo_color "green" "已删除 $dir"
    fi
done

# 删除网络接口
if ip link show docker0 &> /dev/null; then
    echo_color "green" "删除docker0网络接口..."
    ip link delete docker0
fi

# 删除用户组和用户
if getent group docker &> /dev/null; then
    echo_color "green" "删除docker用户组..."
    groupdel docker || true
fi

if id docker &> /dev/null; then
    echo_color "green" "删除docker用户..."
    userdel docker || true
fi

# 清理依赖包
echo_color "green" "清理无用的依赖包..."
case "$OS" in
    "ubuntu"|"debian")
        apt-get autoremove -y
        apt-get autoclean
        ;;
    "centos"|"rhel"|"fedora")
        yum autoremove -y
        yum clean all
        ;;
esac

# 验证卸载结果
echo_color "green" "验证Docker卸载状态..."
if command -v docker &> /dev/null; then
    echo_color "red" "警告：Docker似乎没有完全卸载"
    which docker
    docker --version
else
    echo_color "green" "Docker已成功卸载"
fi

if command -v docker-compose &> /dev/null; then
    echo_color "red" "警告：Docker Compose似乎没有完全卸载"
    docker-compose --version
else
    echo_color "green" "Docker Compose已成功卸载"
fi

echo_color "green" "卸载完成！Docker配置备份位于：$backup_dir"