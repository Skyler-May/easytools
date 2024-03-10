#!/bin/bash

# Define countdown
function countdown {
    local seconds=$1
    
    while [ $seconds -gt 0 ]; do
        echo "倒计时 $seconds 秒后开始"
        sleep 1
        ((seconds--))
    done
}

compose_version=$(docker-compose --version)

# Define echo_color function
function echo_color {
    case "$1" in
        "green")
            echo -e "\033[32m$2\033[0m"
        ;;
        "red")
            echo -e "\033[31m$2\033[0m"
        ;;
        *)
            echo "$2"
        ;;
    esac
}

# 检查系统是否安装 Docker
if [ -z "$compose_version" ]; then
    echo_color "green" "安装 Docker..."
    curl -fsSL https://get.docker.com | bash -s docker
    echo_color "green" "完成"
    countdown 5
    
    echo_color "green" "安装 Docker-compose"
    curl -L "https://github.com/docker/compose/releases/download/v2.19.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    echo_color "green" "安装完成"
    countdown 5
    
    echo_color "green" "赋予 docker-compose 执行权限"
    chmod +x /usr/local/bin/docker-compose
    echo_color "green" "完成"
else
    echo_color "green" "您已安装了 Docker Compose 无需再次安装!"
    echo_color "green" "版本：$compose_version"
fi
