#!/bin/bash

clear

cd "$(dirname "$0")"

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
    "${BOLD}${PURPLE} 安装 XrayR >> ${RESET}"
    "${BOLD}${PURPLE} 更新 XrayR  ${RESET}"
    "${BOLD}${PURPLE} XrayR 日志  ${RESET}"
    
    "${BOLD}${RED} 主菜单 ${RESET}"
)

function show_xrayr_menu() {
    echo -e "=== XrayR 选项 ===\n"
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${RED}b. ${options[$i]}${RESET}\n" # back
        else
            echo -e "${BOLD}${PURPLE}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}

function xrayr_menu_choice() {
    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" choice
    case $choice in
        1)
            clear
            echo -e "${BOLD}${YELLOW} 正在安装... ${RESET}"
            "$XRAYR_INSTALL_OPTIONS_SCRIPT_PATH"
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 更新中... ${RESET}"
            "$UPDATE_XRAYR_SCRIPT_PATH"
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 更新中... ${RESET}"
            cd "$xrayr_release_dir"
            docker-compose -f docker-compose.yml logs
        ;;
        b|B)
            clear
            echo "${BOLD}${WHITE} 返回主菜单！ ${RESET}"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

while true; do
    show_xrayr_menu
    xrayr_menu_choice
    if [[ $choice == "b" || $choice == "B" ]]; then
        break
    fi
done