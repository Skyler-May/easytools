#!/bin/bash
clear
echo -e "\033[96m———————————————————————— EasyTools 工具箱 v1.0.0 ——————————————————————————"
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
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
GRAY=$(tput setaf 0)

RESET=$(tput sgr0)

# Define menu options
options=(
    "${BOLD}${GREEN} 站点部署 >> ${RESET}"
    "${BOLD}${GREEN} XrayR [后端] 部署 >> ${RESET}"
    "${BOLD}${GREEN} 开发中... >> ${RESET}"
    "${BOLD}${GREEN} 开发中... >> ${RESET}"
    "${BOLD}${GREEN} 开发中... >> ${RESET}"
    "${BOLD}${GREEN} 开发中... >> ${RESET}"
    "${BOLD}${GREEN} 开发中... >> ${RESET}"
    "${BOLD}${GREEN} 开发中... >> ${RESET}\n"
    "${BOLD}${RED} 退出 ${RESET}\n"
    "${BOLD}${GRAY} 卸载 ${RESET}\n"
)

# Show menu
function show_menu() {
    echo -e "======== 主菜单 ========\n"
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 2 )) ]]; then
            echo -e "${BOLD}${RED}e. ${options[$i]}${RESET}"  # 将退出选项标记为红色
            elif [[ $i -eq $(( ${#options[@]} -1 )) ]]; then
            echo -e "${BOLD}${GRAY}u. ${options[$i]}${RESET}\n"  # 序号为 u 的卸载选项，标记为灰色
        else
            echo -e "${BOLD}${GREEN}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
    
    # for i in "${!options[@]}"; do
    #     if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
    #         echo -e "${BOLD}${RED}0. ${options[$i]}${RESET}\n"  # 将退出选项标记为红色
    #     else
    #         echo -e "${BOLD}${GREEN}$((i+1)). ${options[$i]}${RESET}"
    #     fi
    # done
}

# Handle user choice
function handle_choice() {
    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" choice
    # 1-1 菜单
    case $choice in
        1)
            clear
            echo -e "${BOLD}${RED} 站点部署 ${RESET}\n"
            # 在这里添加选项1的操作
            cd "$(dirname "$(readlink -f "$0")")/website"  # 这里使用绝对路径
            ./website_menu.sh
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 选项2 ${RESET}"
            # 在这里添加选项2的操作
        ;;
        3)
            clear
            echo -e "${BOLD}${YELLOW} 选项3 ${RESET}"
            # 在这里添加选项3的操作
        ;;
        E|e)
            clear
            exit 0
        ;;
        U|u)
            clear
            echo "${BOLD}${RED} 谢谢使用，再见！ ${RESET}"
            ./easytools/uninstall.sh
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