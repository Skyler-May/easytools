#!/bin/bash

# root
root_need(){
    if [[ $EUID -ne 0 ]]; then
        echo -e "\033[31m 错误:该脚本必须以 root 身份运行! \033[0m" 1>&2
        exit 1
    fi
}

root_need

# 设置安装目录
INSTALL_DIR="/easytools"

# 检查并创建安装目录
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
fi

# 克隆仓库
git clone https://github.com/Skyler-May/easytools.git "$INSTALL_DIR"

# 添加执行权限
find "$INSTALL_DIR" -name "*.sh" -exec chmod +x {} \;

# 检查menu.sh是否存在
if [ ! -f "$INSTALL_DIR/menu.sh" ]; then
    echo -e "\033[31m 错误: menu.sh 文件不存在! \033[0m"
    exit 1
fi

# 创建tools命令的符号链接
if [ -L "/usr/local/bin/tools" ]; then
    rm -f "/usr/local/bin/tools"
fi

ln -sf "$INSTALL_DIR/menu.sh" "/usr/local/bin/tools"

# 验证符号链接
if [ ! -L "/usr/local/bin/tools" ]; then
    echo -e "\033[31m 错误: 创建符号链接失败! \033[0m"
    exit 1
fi

# 检查tools命令是否可执行
if ! command -v tools &> /dev/null; then
    echo -e "\033[31m 错误: tools 命令未能正确安装! \033[0m"
    exit 1
fi

# 清理安装脚本
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    rm -rf "/root/install.sh"
fi

# 运行tools命令
tools