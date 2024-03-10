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

if [ -z "$compose_version" ]; then
    yum install -y yum-utils
    countdown 3
    
    yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    yum install docker-ce docker-ce-cli containerd.io -y
    
    countdown 3
    
    if command -v systemctl &>/dev/null; then
        sudo systemctl start docker
        sudo systemctl enable docker
    else
        sudo service docker start
    fi
else
    echo_color "green" "您已安装了 Docker Compose 无需再次安装"
    echo_color "green" "版本：$compose_version"
fi
