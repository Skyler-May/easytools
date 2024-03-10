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

docker_version=$(docker --version)

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
if [ -z "$docker_version" ]; then
    echo_color "red" "未安装 Docker，现在为您安装..."
    sudo apt-get update
    countdown 3
    
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
    stable"
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    
    countdown 3
    
    if command -v systemctl &>/dev/null; then
        sudo systemctl start docker
        sudo systemctl enable docker
    else
        sudo service docker start
    fi
else
    echo_color "green" "您已安装了 Docker 无需再次安装"
    echo_color "green" "版本：$docker_version"
fi
