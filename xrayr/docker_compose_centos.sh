#!/bin/bash

root_need(){
    if [[ $EUID -ne 0 ]]; then
        echo -e "\033[31m 错误:该脚本必须以 root 身份运行! \033[0m" 1>&2
        exit 1
    fi
}

root_need

function countdown {
    local seconds=$1

    while [ $seconds -gt 0 ]; do
        echo_color "green" "倒计时: $seconds 秒后开始安装"
        sleep 1
        ((seconds--))
    done

    echo_color "green" "正在安装..."
}

# Docker
yum install -y yum-utils
countdown 3

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io -y
countdown 5

systemctl start docker
systemctl enable docker

# Docker-compose
curl -fsSL https://get.docker.com | bash -s docker
curl -L "https://github.com/docker/compose/releases/download/v2.19.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose