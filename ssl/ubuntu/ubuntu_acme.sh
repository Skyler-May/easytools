#!/bin/bash

# Define colors and styles using tput
BOLD=$(tput bold)
GRAY=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

RESET=$(tput sgr0)

# Ubuntu
echo -e "${BOLD}${YELLOW} 正在安装必要的依赖和获取证书..."
apt-get install -y socat
curl https://get.acme.sh | sh
ln -s /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

# 用户注册
echo -e "${BOLD}${YELLOW} 请输入您的邮箱地址："
read email_address
acme.sh --register-account -m "$email_address"

# 开始申请证书
echo -e "${BOLD}${YELLOW} 请输入您的域名："
read your_domain
acme.sh --issue -d "$your_domain" --standalone -k ec-256

# 确认目录是否存在？
mkdir -p /root/certs
if [ $? -ne 0 ]; then
    echo "Failed to create /root/certs directory."
    exit 1
fi

# 安装证书到路径（默认 root/certs 目录）
acme.sh --installcert -d "$your_domain" --ecc --key-file /root/certs/certs.key --fullchain-file /root/certs/certs.crt
echo -e "${BOLD}${YELLOW} 证书申请成功，并已安装到 root/certs 目录下；您可以手动更改使用位置！${RESET}"
