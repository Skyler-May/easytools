#!/bin/bash

clear  # 清屏

# 进入脚本所在目录
cd "$(dirname "$0")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/root/easytools/cert"

# 引入配置
. /root/easytools/config.sh

# Define colors and styles using tput
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
GRAY=$(tput setaf 0)

RESET=$(tput sgr0)

# Define menu options
options=(
    "${BOLD}${PURPLE} CentOS ${RESET}"
    "${BOLD}${PURPLE} ubuntu/Debian ${RESET}\n"
    "${BOLD}${RED} 主菜单 ${RESET}"
)

# Show show_acme
function show_acme() {
    echo -e "======== 证书申请 ========\n"
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
            echo -e "${BOLD}${YELLOW} CentOS ${RESET}"
            # 在这里添加选项1的操作
            "$CENTOS_ACME_SCRIPT_PATH"
            
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} Ubuntu/Debian ${RESET}"
            # 在这里添加选项2的操作
            "$UBUNTU_ACME_SCRIPT_PATH"
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
    show_acme
    handle_choice
    if [[ $choice == "m" || $choice == "M" ]]; then
        break  # 退出循环，返回到调用的主菜单
    fi
done
