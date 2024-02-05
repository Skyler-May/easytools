#!/bin/bash

# 进入脚本所在目录
cd "$(dirname "$0")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/easytools/website/sspanel/ubuntu" # 换为实际名称

# 引入配置
. "/easytools/config.sh"

host="localhost"

# 检查端口
check_port() {
    port=$1
    if timeout 1 bash -c "</dev/tcp/$host/$port" >/dev/null 2>&1; then
        echo "Port $port is open"
        # 直接使用已配置的变量
        $SSL_MENU_SCRIPT_PATH
    else
        echo "Port $port is closed"
        read -p "Do you want to open port $port? (y/n): " choice
        if [ "$choice" == "y" ]; then
            # 在这里添加打开端口的命令，根据你的系统和防火墙工具来定制
            # 示例: ufw allow $port
            echo "Opening port $port..."
        fi
    fi
}

# 检查80端口
check_port 80

# 检查443端口
check_port 443
