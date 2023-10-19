#!/bin/bash
clear  # 清屏
echo -e "\033[96m—————————————————— EasyTools 工具箱 v1.0.0 ————————————————————"
echo "   _____   ____   _____   _    _   _____   _   _   _  "
echo "  |  ___| |  _ \ |  ___| | |  | | |  _  | | | | | | | "
echo "  | |___  | |_| || |___  | |__| | | |_| | | |_| |_| | "
echo "  |_____| |____/ |_____| |______| |_____| |_________| "
echo "                                                      "

# Define colors and styles using tput
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)

RESET=$(tput sgr0)

# Define menu options
options=(
  "${BOLD}${GREEN}Docker 部署站点 --> ${RESET}" 
  "${BOLD}${GREEN}docker 部署 XrayR ${RESET}" 
  "${BOLD}${GREEN}SSL 证书申请${RESET}" 
  "${BOLD}${RED}退出${RESET}"
)

# Show menu
function show_menu() {
    echo "=== 主菜单 ==="
    for i in "${!options[@]}"; do
        if ((i == 3)); then
            echo "${BOLD}${RED}$((i+1)). ${options[$i]}${RESET}"
        else
            echo "${BOLD}${YELLOW}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}

# Handle user choice
function handle_choice() {
    read -p "${BOLD}${PURPLE} 请输入选项编号: ${RESET}" choice
    case $choice in
        1)
            clear  # 清屏
            echo "${RED}你即将进行以下操作...${RESET}"
                while true; do
                    echo "${BOLD}${YELLOW}=== 站点相关 === ${RESET}"
                    echo "${BOLD}${YELLOW} 1. 安装 V2Board ${RESET}"
                    echo "${BOLD}${YELLOW} 2. 安装 SSPanel ${RESET}"
                    echo "${BOLD}${YELLOW} 3. 安装 wordprees ${RESET}"
                    echo "${BOLD}${YELLOW} 4. 返回上一级菜单 ${RESET}"
                    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" sub_choice
                    case $sub_choice in
                        1)
                            clear  # 清屏
                            echo "Docker 部署 V2Board "
                            git clone https://github.com/Sam-Mey/some_project /etc/esh/some_project
                            # ./V2Board.sh  # 调用同目录下的 script_one.sh 脚本
                            ;;
                        2)
                            clear  # 清屏
                            echo "Docker 部署 SSPanel"
                            ./SSPanel.sh  # 调用同目录下的 script_one.sh 脚本
                            ;;
                        3)
                            clear  # 清屏
                            echo "Docker 部署 wordprees"
                            ./wordprees.sh  # 调用同目录下的 script_one.sh 脚本
                            ;;
                        4)
                            clear  # 清屏
                            break
                            ;;
                        *)
                            echo "无效选项，请重新选择"
                            ;;
                    esac
                done
                ;;
        2)
            echo "${GREEN}你选择了选项二${RESET}"
            # 在这里添加选项二的操作
            ;;
        3)
            echo "${YELLOW}你选择了选项三${RESET}"
            # 在这里添加选项三的操作
            ;;
        4)
            echo "${BOLD}谢谢使用，再见！${RESET}"
            exit 0
            ;;
        *)
            echo "无效选项，请重新选择"
            ;;
    esac
}

# 主循环
while true; do
    show_menu
    handle_choice
done

export PATH=$PATH:/etc/esh