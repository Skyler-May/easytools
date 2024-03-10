#!/bin/bash

clear

# 进入脚本所在目录
cd "$(dirname "$0")"

# 引入配置
. /easytools/config.sh

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
    "${BOLD}${PURPLE} Ubuntu/Debian ${RESET}"
    "${BOLD}${PURPLE} arm64 ${RESET}"
    "${BOLD}${PURPLE} CentOS ${RESET}\n"
    
    "${BOLD}${WHITE} 上一级[XrayR] ${RESET}"
)

# Show 替换为实际名称
function show_xrayr_install_options() {
    echo -e "======== xrayr install options ========\n" # 换为实际名称
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${WHITE}b. ${options[$i]}${RESET}\n"  # back
        else
            echo -e "${BOLD}${PURPLE}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}

# xrayr_install_options user choice
function xrayr_install_options_choice() {
    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" choice
    # 1-1 菜单
    case $choice in
        1)
            clear
            echo -e "${BOLD}${YELLOW} Ubuntu/Debian ${RESET}"
            "$UBUNTU_DEBIAN_SCRIPT_PATH"
            "$COMPOSE_SCRIPT_PATH"
            "$RUNXRAYR_SCRIPT_PATH"
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} arm64 ${RESET}"
            "$ARM64_SCRIPT_PATH"
            "$COMPOSE_SCRIPT_PATH"
            "$RUNXRAYR_SCRIPT_PATH"
        ;;
        3)
            clear
            echo -e "${BOLD}${YELLOW} CentOS ${RESET}"
            "$CENTOS_SCRIPT_PATH"
            "$COMPOSE_SCRIPT_PATH"
            "$RUNXRAYR_SCRIPT_PATH"
        ;;
        b|B)
            clear
            echo "${BOLD}${WHITE} [XrayR] ${RESET}"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

# 主循环
while true; do
    show_xrayr_install_options # 换为实际名称
    xrayr_install_options_choice
    if [[ $choice == "b" || $choice == "B" ]]; then
        break  # 退出循环，返回到调用的主菜单
    fi
done