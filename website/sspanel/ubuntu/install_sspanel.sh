#!/bin/bash

# 进入脚本所在目录
cd "$(dirname "$0")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/easytools/website/sspanel/ubuntu" # 换为实际名称

# 引入配置
. "/easytools/config.sh"

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

# Define menu options
options=(
    "${BOLD}${PURPLE} 步骤1 ${RESET}"
    "${BOLD}${PURPLE} 步骤2 ${RESET}"
    "${BOLD}${RED} 主菜单 ${RESET}"
)

# Show 替换为实际名称
function show_install_sspanel() {
    echo -e "======== XXX ========\n" # 换为实际名称
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${RED}m. ${options[$i]}${RESET}\n"  # 将返回选项标记为红色
        else
            echo -e "${BOLD}${PURPLE}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}

# Handle user choice
function handle_choice() {
    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" choice
    # 1-1 菜单
    case $choice in
        1)
            clear
            echo -e "${BOLD}${YELLOW} 申请证书 ${RESET}"
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
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 选项2 ${RESET}"
            # 在这里添加选项2的操作
        ;;
        M|m)
            clear
            echo "${BOLD}${RED} 返回主菜单！ ${RESET}"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

# 主循环
while true; do
    show_install_sspanel # 换为实际名称
    handle_choice
    if [[ $choice == "m" || $choice == "M" ]]; then
        break  # 退出循环，返回到调用的主菜单
    fi
done