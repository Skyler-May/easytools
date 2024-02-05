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

# CentOS
echo -e "${BOLD}${GREEN} 正在安装必要的依赖和获取证书... ${RESET}"
yum install -y socat
curl https://get.acme.sh | sh
ln -s /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

# 用户注册
echo -e "${BOLD}${RED} 请输入您的邮箱地址： ${RESET}"
read email_address
acme.sh --register-account -m "$email_address"

# 开始申请证书
echo -e "${BOLD}${RED} 请输入您的域名： ${RESET}"
read your_domain
acme.sh --issue -d "$your_domain" --standalone -k ec-256

# 安装证书到路径
acme.sh --installcert -d "$your_domain" --ecc --key-file /root/certs/private.key --fullchain-file /root/certs/certificate.crt
echo -e "${BOLD}${GREEN} 证书申请成功，并已安装到 root/certs 目录下；您可以手动更改使用位置！${RESET}"
