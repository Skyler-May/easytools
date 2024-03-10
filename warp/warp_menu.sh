#!/bin/bash

clear

# 进入脚本所在目录
cd "$(dirname "$0")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/easytools/warp" # 换为实际名称

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
    "${BOLD}${PURPLE} 安装 ${RESET}"
    "${BOLD}${PURPLE} 呼出 warp ${RESET}\n"
    "${BOLD}${RED} 主菜单 ${RESET}"
)

# Show warp
function show_warp() {
    echo -e "${BOLD}${PURPLE}======== warp ========${RESET}\n" # 换为实际名称
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${RED}b. ${options[$i]}${RESET}\n"  # 将返回选项标记为红色
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
            echo -e "${BOLD}${YELLOW} 安装 ${RESET}"
            "$WARP_INSTALL_SCRIPT_PATH"
        ;;
        2)
            clear
            "$WARP_CALL_SCRIPT_PATH"
        ;;
        M|m)
            clear
            echo -e "${BOLD}${RED} [主菜单] ${RESET}"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

# 主循环
while true; do
    show_warp # 换为实际名称
    handle_choice
    if [[ $choice == "b" || $choice == "B" ]]; then
        break  # 退出循环，返回到调用的主菜单
    fi
done