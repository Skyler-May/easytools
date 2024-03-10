#!/bin/bash

# font color
BOLD=$(tput bold) 
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3) 
RESET=$(tput sgr0)

# Function to identify the process using port 80
function get_process_on_port_80() {
  # Use netstat for broader compatibility (may require root privileges)
  local process=$(sudo lsof -i :80 | awk 'NR==2{print $1}')
  echo -e "$process"
}

# Get the process name
process_name=$(get_process_on_port_80)

# Check if a process is using port 80 and stop it if necessary
if [[ ! -z "$process_name" ]]; then
  # Use systemctl if a service manages the process (more robust)
  if systemctl status "$process_name" &> /dev/null; then
    sudo systemctl stop "$process_name"
    echo -e "${RED} Stopped service $process_name using port 80.${RESET}"
  else
    # Fallback: Use kill if systemctl doesn't manage the process
    sudo kill $(pgrep -f "$process_name") 2> /dev/null
    echo -e "${RED} Stopped process $process_name using port 80 (assuming it's not a service).${RESET}"
  fi
else
  echo -e "${RED} No process is using port 80.${RESET}"
fi

echo -e "${BOLD}${GREEN}正在安装必要的依赖和获取证书...${RESET}"
apt-get install -y socat
curl https://get.acme.sh | sh
ln -s /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

# register
echo -e "${BOLD}${GREEN}请输入您的邮箱地址：${RESET}"
read email_address
acme.sh --register-account -m "$email_address"

# request
echo -e "${BOLD}${GREEN}请输入您的域名：${RESET}"
read your_domain
acme.sh --issue -d "$your_domain" --standalone -k ec-256

# installation ( root )
CERTS_DIR="/root/certs"
PRIVATE_KEY="$CERTS_DIR/private.key"
CERTIFICATE_CRT="$CERTS_DIR/certificate.crt"

if [ ! -d "$CERTS_DIR" ]; then
    echo "Certs folder not found. Creating..."
    mkdir "$CERTS_DIR"
    echo "Certs folder created."
else
    echo -e "${GREEN}Certs folder already exists. Executing Certs installation...${RESET}"
    acme.sh --installcert -d "$your_domain" --ecc --key-file $PRIVATE_KEY --fullchain-file $CERTIFICATE_CRT

    # 检查 private.key 和 certificate.crt 是否存在
    if [ -f "$PRIVATE_KEY" ] && [ -f "$CERTIFICATE_CRT" ]; then
        echo -e "Certificate installation ${GREEN}successful.${RESET}"
    else
        echo -e "${RED}Certificate installation failed. Either private.key or certificate.crt is missing.${RESET}"
    fi
fi