#!/bin/bash

# 获取主目录路径
MAIN_DIR="$(dirname "$(readlink -f "$0")")"


clear  # 清屏
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
    "${BOLD}${GREEN} v2board >> ${RESET}"
    "${BOLD}${GREEN} SSPanel >> ${RESET}"
    "${BOLD}${GREEN} wordpress >> ${RESET}"
    "${BOLD}${GREEN} 开发中... >> ${RESET}\n"
    "${BOLD}${RED} 主菜单 ${RESET}"
)

# Show menu
function show_menu() {
    echo -e "======== 站点部署 ========\n"
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${RED}m. ${options[$i]}${RESET}\n"  # 将退出选项标记为红色
        else
            echo -e "${BOLD}${GREEN}$((i+1)). ${options[$i]}${RESET}"
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
            echo -e "${BOLD}${YELLOW} 选项1 ${RESET}"
            # 在这里添加选项三的操作
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 选项2 ${RESET}"
            # 在这里添加选项三的操作
        ;;
        3)
            clear
            echo -e "${BOLD}${YELLOW} 选项3 ${RESET}"
            # 在这里添加选项三的操作
        ;;
        4)
            clear
            echo -e "${BOLD}${YELLOW} 开发中... ${RESET}"
            # 在这里添加选项三的操作
        ;;
        M|m)
            clear
            echo "${BOLD}${RED} 返回主菜单！ ${RESET}"
            MENU_SCRIPT_PATH="$MAIN_DIR/../menu.sh"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

# 主循环
while true; do
    show_menu
    handle_choice
done