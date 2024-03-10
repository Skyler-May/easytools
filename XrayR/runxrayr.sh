#!/bin/bash

# 定义颜色和样式
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
PURPLE=$(tput setaf 5)
RESET=$(tput sgr0)

function type_message() {
    message=$1
    for ((i=0; i<${#message}; i++)); do
        echo -n "${BOLD}${YELLOW}${message:$i:1}${RESET}"
        sleep 0.15   # 调整此处的 sleep 时间以控制打字速度
    done
    echo   # 换行
}

# 示例消息
prompt="由于一键安装过程人工无法干预，您需要先配置好 'config.yml' 文件并上传到 'root' 目录下；相关配置可到 'XrayR官网' 了解详情或使用本项目中的配置文件（项目中的配置文件与官方一致，可放心使用）"

# 调用函数打印消息
type_message "$prompt"

# 提示用户确认
read -p "${BOLD}${PURPLE}Are you ready? (Y/N): ${RESET}" choice

# 将用户输入转换为大写
choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')

if [ "$choice" == "Y" ]; then
    # 指定目录的路径
    destination_dir1="/root/XrayR-release/config"
    destination_dir2="/root/XrayR-release"

    # 检查目标目录是否存在，如果不存在则创建
    if [ ! -d "$destination_dir1" ]; then
        echo -e "${RED}目标目录不存在，无法移动 config.yml${RESET}"
        exit 1
    fi

    if [ ! -d "$destination_dir2" ]; then
        echo -e "${RED}目标目录不存在，无法移动 docker-compose.yml${RESET}"
        exit 1
    fi

    # 移动 config.yml 到目标目录1
    mv -v config.yml "$destination_dir1"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}config.yml 成功移动到目标目录${RESET}"
    else
        echo -e "${RED}config.yml 移动失败${RESET}"
    fi

    # 移动 docker-compose.yml 到目标目录2
    mv -v docker-compose.yml "$destination_dir2"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}docker-compose.yml 成功移动到目标目录${RESET}"
    else
        echo -e "${RED}docker-compose.yml 移动失败${RESET}"
    fi

    # 执行
    # 指定 XrayR-release 目录的路径
    xrayr_release_dir="/root/XrayR-release"

    # 切换到 XrayR-release 目录
    cd "$xrayr_release_dir"

    docker-compose -f docker-compose.yml up -d

    cd "$root_dir"
    rm -rf install_XrayR.sh
else
    # 用户选择不继续
    echo -e "${YELLOW}Okey, you need to be prepared.${RESET}"
fi
