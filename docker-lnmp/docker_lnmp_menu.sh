#!/bin/bash

# 检查系统是否安装了 Docker
check_docker_installed() {
    if command -v docker &> /dev/null; then
        echo "Docker 已安装"
        return 0  # 返回 0 表示已安装
    else
        echo "Docker 未安装"
        return 1  # 返回 1 表示未安装
    fi
}

clear

# 进入脚本所在目录
cd "$(dirname "$0")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/easytools/docker-lnmp" # 换为实际名称

# 引入配置
. "/easytools/config.sh"

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
    "${BOLD}${PURPLE} 安装 ${RESET}\n"
    
    "${BOLD}${PURPLE} 查看容器/状态 ${RESET}"
    "${BOLD}${PURPLE} 查看镜像/网络 ${RESET}"
    "${BOLD}${PURPLE} 查看容器/日志 >> ${RESET}\n"
    
    "${BOLD}${RED} 返回主菜单 ${RESET}"
    "${BOLD}${GRAY} 删除所有容器及网络 ${RESET}"
)

# Show 替换为实际名称
function show_docker_lnmp_menu() {
    echo -e "${BOLD}${PURPLE}======== Docker LNMP ========${RESET}\n" # 换为实际名称
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 2 )) ]]; then
            echo -e "${BOLD}${RED}m. ${options[$i]}${RESET}\n"  # 将返回选项标记为红色
            elif [[ $i -eq $(( ${#options[@]} -1 )) ]]; then
            echo -e "${BOLD}${GRAY}r. ${options[$i]}${RESET}\n"  # r 卸载选项，标记为灰色
        else
            echo -e "${BOLD}${PURPLE}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}

# Handle user choice
function handle_choice() {
    read -p "${BOLD}${PURPLE} 请输入选项编号: ${RESET}" choice
    # 1-1 菜单
    case $choice in
        1)
            # 检查是否安装了 Docker
            if command -v docker &> /dev/null; then
                clear
                echo -e "${BOLD}${YELLOW} Docker 已安装，可以继续执行脚本 ${RESET}"
                "$INSTALL_DOCKER_LNMP_SCRIPT_PATH"
            else
                echo -e "${RED}未安装 Docker !!! 即将为您安装 Docker...${RESET}"
                "$DOCKER_SCRIPT_PATH"
                
                # 再次检查 Docker 是否安装成功
                if command -v docker &> /dev/null; then
                    echo -e "${BOLD}${YELLOW} Docker 安装成功，可以继续执行脚本 ${RESET}"
                    "$INSTALL_DOCKER_LNMP_SCRIPT_PATH"
                else
                    echo -e "${RED}Docker 安装失败，请检查安装过程中的错误。无法继续执行 LNMP 脚本.${RESET}"
                fi
            fi
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 容器状态 ${RESET}"
            docker ps -a
        ;;
        3)
            clear
            echo -e "${BOLD}${YELLOW} 镜像/网络 ${RESET}"
            docker images
            docker network ls
        ;;
        4)
            clear
            echo -e "${BOLD}${YELLOW} 容器日志 ${RESET}"
            cd /docker-lnmp/www/sites
            "$CHECK_CONTAINER_LOGS_SCRIPT_PATH"
        ;;
        # 5)
        
        # ;;
        # 6)
        
        # ;;
        # 7)
        
        # ;;
        # 8)
        
        # ;;
        # 9)
        
        # ;;
        # 10)
        
        # ;;
        # 11)
        
        # ;;
        # 12)
        
        # ;;
        
        M|m)
            clear
            echo "${BOLD}${RED} [主菜单] ${RESET}"
        ;;
        R|r)
            clear
            echo "${BOLD}${GRAY} 删除所有镜像、容器及网络 ${RESET}"
            "$DELETE_CONTAINER_NETWORK_SCRIPT_PATH"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

# 主循环
while true; do
    show_docker_lnmp_menu # 换为实际名称
    handle_choice
    if [[ $choice == "m" || $choice == "M" ]]; then
        break  # 退出循环，返回到调用的主菜单
    fi
done