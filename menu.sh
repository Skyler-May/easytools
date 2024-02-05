#!/bin/bash

clear

# 设置版本号
VERSION="v1.1.4"

# 打印当前工作目录
# echo "Current working directory: $(pwd)"

# 设置脚本所在目录为当前工作目录
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# 打印执行 cd 命令（改变当前工作目录）之后，输出改变后的当前工作目录
# echo "Current working directory after cd: $(pwd)"

# 引入配置
. /easytools/config.sh

# # 打印调试信息
# echo "SCRIPT_DIR: $SCRIPT_DIR"
# echo "MENU_SCRIPT_PATH: $MENU_SCRIPT_PATH"
# echo "WEBSITE_MENU_SCRIPT_PATH: $WEBSITE_MENU_SCRIPT_PATH"
# echo "ACME_SCRIPT_PATH: $ACME_SCRIPT_PATH"

echo -e "\033[96m—————————————————————————— EasyTools 工具箱 $VERSION ————————————————————————————"
echo "                                                                                "
echo " ▓█████  ▄▄▄        ██████ ▓██   ██▓ ███████▓ ▒█████   ▒█████   ██▓      ██████ "
echo " ▓█   ▀ ▒████▄    ▒██    ▒  ▒██  ██▒▓  ██▒ ▓▒▒██▒  ██▒▒██▒  ██▒▓██▒    ▒██    ▒ "
echo " ▒███   ▒██  ▀█▄  ░ ▓██▄     ▒██ ██░▒ ▓██░ ▒░▒██░  ██▒▒██░  ██▒▒██░    ░ ▓██▄   "
echo " ▒▓█  ▄ ░██▄▄▄▄██   ▒   ██▒  ░ ▐██▓░░ ▓██▓ ░ ▒██   ██░▒██   ██░▒██░      ▒   ██▒"
echo " ░▒████▒ ▓█   ▓██▒▒██████▒▒  ░ ██▒▓░  ▒██▒ ░ ░ ████▓▒░░ ████▓▒░░██████▒▒██████▒▒"
echo " ░░ ▒░ ░ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░   ██▒▒▒   ▒ ░░   ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░▓  ░▒ ▒▓▒ ▒ ░"
echo "  ░ ░  ░  ▒   ▒▒ ░░ ░▒  ░ ░ ▓██ ░▒░     ░      ░ ▒ ▒░   ░ ▒ ▒░ ░ ░ ▒  ░░ ░▒  ░ ░"
echo "    ░     ░   ▒   ░  ░  ░   ▒ ▒ ░░    ░      ░ ░ ░ ▒  ░ ░ ░ ▒    ░ ░   ░  ░  ░  "
echo "    ░  ░      ░  ░      ░   ░ ░                  ░ ░      ░ ░      ░  ░      ░  "
echo "                            ░ ░                                                 "
echo "                                                                                "

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
    "${BOLD}${BLUE} 站点部署 >> ${RESET}"
    "${BOLD}${BLUE} 证书申请 >> ${RESET}"
    "${BOLD}${BLUE} warp 解锁 Netflix >> ${RESET}"
    "${BOLD}${BLUE} Docker LNMP >> ${RESET}"
    "${BOLD}${GRAY} 开发中... >> ${RESET}"
    "${BOLD}${GRAY} 开发中... >> ${RESET}"
    "${BOLD}${GRAY} 开发中... >> ${RESET}"
    "${BOLD}${GRAY} 开发中... >> ${RESET}\n"
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
    # 1-1 菜单
    case $choice in
        1)
            clear
            echo -e "${BOLD}${YELLOW} 站点部署 ${RESET}\n"
            # 在这里添加选项1的操作
            "$WEBSITE_MENU_SCRIPT_PATH"
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 证书申请 ${RESET}"
            # 在这里添加选项2的操作
            "$SSL_MENU_SCRIPT_PATH"
        ;;
        3)
            clear
            echo -e "${BOLD}${YELLOW} warp 解锁 ${RESET}"
            # 在这里添加选项3的操作
            "$WARP_MENU_SCRIPT_PATH"
        ;;
        4)
            clear
            echo -e "${BOLD}${YELLOW} Docker LNMP ${RESET}"
            # 在这里添加选项4的操作
            "$DOCKER_LNMP_MENU_SCRIPT_PATH"
        ;;
        Q|q)
            clear
            echo "${BOLD}${RED} 谢谢使用，再见！ ${RESET}"
            exit 0
        ;;
        U|u)
            clear
            echo "${BOLD}${GREEN} 正在更新... ${RESET}"
            "$UPDATE_SCRIPT_PATH"
        ;;
        
        R|r)
            clear
            # echo "${BOLD}${RED} 谢谢使用，再见！ ${RESET}"
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