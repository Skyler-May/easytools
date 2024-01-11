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

# Handle user choice
function handle_choice() {
    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" choice
    # 1-1 菜单
    case $choice in
        1)
            clear  # 清屏
            echo -e "${BOLD}${RED}你即将进行以下操作...${RESET}\n"
            while true; do
                echo -e "${BOLD}${YELLOW}=== 站点相关 === ${RESET}\n"
                echo -e "${BOLD}${YELLOW} 1. V2Board >> ${RESET}"
                echo -e "${BOLD}${YELLOW} 2. SSPanel >> ${RESET}"
                echo -e "${BOLD}${YELLOW} 3. wordpress >> ${RESET}\n"
                echo -e "${BOLD}${RED} 01. 返回上一级菜单 ${RESET}\n"
                read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" sub_choice
                # 1-2 菜单
                case $sub_choice in
                    1)
                        clear  # 清屏
                        while true; do
                            echo -e "${BOLD}${BLUE}=== V2Board === ${RESET}\n"
                            echo -e "${BOLD}${BLUE} 1. 安装 ${RESET}"
                            echo -e "${BOLD}${BLUE} 2. 更新 ${RESET}"
                            echo -e "${BOLD}${BLUE} 3. 运行状态 ${RESET}\n"
                            echo -e "${BOLD}${RED} 01. 返回上一级菜单 ${RESET}\n"
                            read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" sub_choice
                            # 1-3 菜单
                            case $sub_choice in
                                1)
                                    clear  # 清屏
                                    echo -e "${BOLD}${GREEN} 正在执行安装...${RESET}"
                                    
                                ;;
                                2)
                                    clear  # 清屏
                                    echo "更新"
                                    #
                                ;;
                                3)
                                    clear  # 清屏
                                    echo "运行状态"
                                ;;
                                01)
                                    clear  # 清屏
                                    # return # 返回主菜单
                                    break # 返回上一级菜单
                                ;;
                                *)
                                    clear  # 清屏
                                    echo "无效选项，请重新选择"
                                ;;
                            esac
                        done
                    ;;
                    2)
                        clear  # 清屏
                        echo "Docker 部署 SSPanel"
                        ./SSPanel.sh  # 调用同目录下的 script_one.sh 脚本
                    ;;
                    3)
                        clear  # 清屏
                        echo "Docker 部署 XrayR"
                        # /etc/easytools/install_XrayR.sh  # 调用同目录下的 script_one.sh 脚本
                    ;;
                    01)
                        clear  # 清屏
                        break
                    ;;
                    *)
                        clear  # 清屏
                        echo "无效选项，请重新选择"
                    ;;
                esac
            done
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
        0)
            echo "${BOLD}${RED} 谢谢使用，再见！ ${RESET}"
            exit 0
        ;;
        *)
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

# 主循环
while true; do
    show_menu
    handle_choice
done