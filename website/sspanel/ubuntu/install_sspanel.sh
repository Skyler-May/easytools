#!/bin/bash

host="localhost"

# 检查端口
check_port() {
    port=$1
    if timeout 1 bash -c "</dev/tcp/$host/$port" >/dev/null 2>&1; then
        echo "Port $port is open"
    else
        echo "Port $port is closed"
        read -p "Do you want to open port $port? (y/n): " choice
        if [ "$choice" == "y" ]; then
            # 在这里添加打开端口的命令，例如使用防火墙工具如ufw
            # 示例: ufw allow $port
            echo "Opening port $port..."
        fi
    fi
}

check_port 80
check_port 443
