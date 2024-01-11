#!/bin/bash
clear  # 清屏
echo -e "\033[96m—————————————————— EasyTools 工具箱 v1.0.0 ————————————————————"
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

RESET=$(tput sgr0)

Define menu options
# Define menu options
options=(
    "${BOLD}${GREEN} 站点部署 >> ${RESET}"
    "${BOLD}${GREEN} XrayR [后端] 部署 >> ${RESET}"
    "${BOLD}${GREEN}开发中... >> ${RESET}"
    "${BOLD}${GREEN}开发中... >> ${RESET}"
    "${BOLD}${GREEN}开发中... >> ${RESET}"
    "${BOLD}${GREEN}开发中... >> ${RESET}"
    "${BOLD}${GREEN}开发中... >> ${RESET}"
    "${BOLD}${GREEN}开发中... >> ${RESET}\n"
    "${BOLD}${RED}退出${RESET}"
)

# Show menu
function show_menu() {
    echo -e "======== 主菜单 ========\n"
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${RED}0. ${options[$i]}${RESET}\n"  # 将退出选项标记为红色
        else
            echo -e "${BOLD}${GREEN}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}



# # 主循环
# while true; do
#     show_menu
#     handle_choice
# done