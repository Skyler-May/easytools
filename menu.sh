#!/bin/bash

# root权限
root_need(){
    if [[ $EUID -ne 0 ]]; then
        echo -e "\033[31m 错误:该脚本必须以 root 身份运行! \033[0m" 1>&2
        exit 1
    fi
}

root_need

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

echo -e "\033[96m —————————————————————————————— EasyTools 工具箱 ——————————————————————————————\n"

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

echo ""
echo -e "${BOLD}${YELLOW} 使用：${RESET}"
echo -e "${BOLD}${YELLOW}    安装完成后，再次使用只需键入 'tools' 即可调出脚本 ${RESET}\n"

ip_address=$(curl -s ifconfig.me)
region_code=$(curl -s ipinfo.io/country)
system_info=$(cat /etc/*-release 2>/dev/null | grep -E "PRETTY_NAME" | cut -d= -f2)
architecture=$(uname -m)
echo -e "${YELLOW} 系统信息：${RESET}"
echo -e "${YELLOW}       IP  ：$ip_address ${RESET}"
echo -e "${YELLOW}       地区：$region_code ${RESET}"
echo -e "${YELLOW}       系统：$system_info"
echo -e "${YELLOW}       架构：$architecture ${RESET}\n"

echo "${BOLD}${GRAY}Script: ${RESET}"
VERSION_INFO=$(cat ./version.json)
VERSION=$(echo $VERSION_INFO | grep -o '"version": *"[^"]*"' | awk -F'"' '{print $4}')
echo "${BOLD}${GRAY}Version: $VERSION${RESET}"
RELEASE_DATE=$(echo $VERSION_INFO | grep -o '"release_date": *"[^"]*"' | awk -F'"' '{print $4}')
echo "${BOLD}${GRAY}Release Date: $RELEASE_DATE${RESET}"
AUTHOR=$(echo $VERSION_INFO | grep -o '"author": *"[^"]*"' | awk -F'"' '{print $4}')
echo "${BOLD}${GRAY}Author: $AUTHOR${RESET}"

# Define menu options
options=(
    "${BOLD}${BLUE} 安装 Docker  >> ${RESET}"
    "${BOLD}${BLUE} 证书申请 >> ${RESET}"
    "${BOLD}${BLUE} warp 解锁 Netflix >> ${RESET}"
    "${BOLD}${BLUE} Docker 部署 LNMP >> ${RESET}\n"

    "${BOLD}${RED} 退出 ${RESET}"
    "${BOLD}${GREEN} 更新 ${RESET}"
    "${BOLD}${GRAY} 卸载 ${RESET}"
)

# Show menu
function show_menu() {
    echo -e "${BOLD}${BLUE} —————— 主菜单 —————— ${RESET}\n"
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 3 )) ]]; then
            echo -e "${BOLD}${RED}q. ${options[$i]}${RESET}"  # q 退出选项，标记为红色
            elif [[ $i -eq $(( ${#options[@]} -2 )) ]]; then
            echo -e "${BOLD}${GREEN}u. ${options[$i]}${RESET}"  # u 更新选项，标记为绿色
            elif [[ $i -eq $(( ${#options[@]} -1 )) ]]; then
            echo -e "${BOLD}${GRAY}d. ${options[$i]}${RESET}\n"  # d 卸载选项，标记为灰色
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
            echo -e "${BOLD}${YELLOW} 安装 Docker ${RESET}\n"
            "$DDSYSTEM_SCRIPT_PATH"
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} acme 证书申请 ${RESET}"
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
        D|d)
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
