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

# Install Docker on Debian-based systems
function install_docker_debian {
    echo_color "red" "未安装 Docker，现在为您安装..."
    sudo apt-get update
    countdown 3
    
    sudo apt-get install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
    
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    
    countdown 3
    
    start_docker_service
}

# Start Docker service
function start_docker_service {
    if command -v systemctl &>/dev/null; then
        sudo systemctl start docker
        sudo systemctl enable docker
    else
        sudo service docker start
    fi
}

docker_version=$(docker --version)

# 检查系统是否安装 Docker
if [ -z "$docker_version" ]; then
    install_docker_debian
else
    echo_color "green" "您已安装了 Docker 无需再次安装"
    echo_color "green" "版本：$docker_version"
fi
