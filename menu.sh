#!/bin/bash

clear

cd "$(dirname "${BASH_SOURCE[0]}")" || exit
# echo "Current working directory: $(pwd)"
# echo "Current working directory after cd: $(pwd)"

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
 
echo -e "\033[96m———————————————————————————— EasyTools 工具箱 $VERSION ————————————————————————————033[0m"
# color arr
colors=("38;5;196" "38;5;202" "38;5;208" "38;5;214" "38;5;220")

logo=(" ███████╗ █████╗ ███████╗██╗   ██╗████████╗ ██████╗  ██████╗ ██╗     ███████╗ "
      " ██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝ "
      " █████╗  ███████║███████╗ ╚████╔╝    ██║   ██║   ██║██║   ██║██║     ███████╗ "
      " ██╔══╝  ██╔══██║╚════██║  ╚██╔╝     ██║   ██║   ██║██║   ██║██║     ╚════██║ "
      " ███████╗██║  ██║███████║   ██║      ██║   ╚██████╔╝╚██████╔╝███████╗███████║ ")

# 循环应用颜色并输出 logo
for ((i=0; i<${#logo[@]}; i++)); do
    color="\033[${colors[i]}m"
    reset="\033[0m"
    
    echo -e "${color}${logo[i]}${reset}"
done

echo -e "${BOLD}${YELLOW} 温馨提示：${RESET}\n"
echo -e "${BOLD}${YELLOW}       此脚本仅支持 Ubuntu Debian arm64 系统; ${RESET}"
echo -e "${BOLD}${YELLOW}       amd 及其他系统敬请期待... ${RESET}"
echo -e "${BOLD}${YELLOW}       安装完成后，再次使用只需键入 'et' 即可呼出脚本 ${RESET}\n"

VERSION_INFO=$(cat ./version.json)
VERSION=$(echo $VERSION_INFO | grep -o '"version": *"[^"]*"' | awk -F'"' '{print $4}')
echo "Version: $VERSION"
RELEASE_DATE=$(echo $VERSION_INFO | grep -o '"release_date": *"[^"]*"' | awk -F'"' '{print $4}')
echo "Release Date: $RELEASE_DATE"
AUTHOR=$(echo $VERSION_INFO | grep -o '"author": *"[^"]*"' | awk -F'"' '{print $4}')
echo "Author: $AUTHOR"

# Define menu options
options=(
    "${BOLD}${BLUE} 站点部署 >> ${RESET}"
    "${BOLD}${BLUE} 证书申请 >> ${RESET}"
    "${BOLD}${BLUE} warp 解锁 Netflix >> ${RESET}"
    "${BOLD}${BLUE} Docker LNMP >> ${RESET}\n"
    # "${BOLD}${GRAY} 开发中... >> ${RESET}"
    # "${BOLD}${GRAY} 开发中... >> ${RESET}"
    # "${BOLD}${GRAY} 开发中... >> ${RESET}"
    # "${BOLD}${GRAY} 开发中... >> ${RESET}\n"
    "${BOLD}${RED} 退出 ${RESET}"
    "${BOLD}${GREEN} 更新 ${RESET}"
    "${BOLD}${GRAY} 卸载 ${RESET}"
)

# Show menu
function show_menu() {
    echo -e "${BOLD}${BLUE}——————————————————————————————— 主菜单 $VERSION —————————————————————————————————${RESET}\n"
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 3 )) ]]; then
            echo -e "${BOLD}${RED}q. ${options[$i]}${RESET}"  # q 退出选项，标记为红色
            elif [[ $i -eq $(( ${#options[@]} -2 )) ]]; then
            echo -e "${BOLD}${GREEN}u. ${options[$i]}${RESET}"  # u 更新选项，标记为绿色
            elif [[ $i -eq $(( ${#options[@]} -1 )) ]]; then
            echo -e "${BOLD}${GRAY}r. ${options[$i]}${RESET}\n"  # r 卸载选项，标记为灰色
        else
            echo -e "${BOLD}${BLUE}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}

# Handle user choice
function handle_choice() {
    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" choice
    case $choice in
        1)
            clear
            echo -e "${BOLD}${YELLOW} 站点部署 ${RESET}\n"
            "$WEBSITE_MENU_SCRIPT_PATH"
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 证书申请 ${RESET}"
            "$ACME_SCRIPT_PATH"
        ;;
        3)
            clear
            echo -e "${BOLD}${YELLOW} warp 解锁 ${RESET}"
            "$WARP_MENU_SCRIPT_PATH"
        ;;
        4)
            clear
            echo -e "${BOLD}${YELLOW} Docker LNMP ${RESET}"
            "$DOCKER_LNMP_MENU_SCRIPT_PATH"
        ;;
        Q|q)
            clear
            echo "${BOLD}${RED} 谢谢使用，再见！ ${RESET}"
            exit 0
        ;;
        U|u)
            clear
            echo "${BOLD}${GREEN} 正在更新 EasyTools... ${RESET}"
            "$UPDATE_SCRIPT_PATH"
        ;;
        R|r)
            clear
            "$UNINSTALL_SCRIPT_PATH"
            exit 0
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
