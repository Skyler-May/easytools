#!/bin/bash

clear

# 进入脚本所在目录
cd "$(dirname "$0")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/easytools/docker-lnmp/ubuntu-debian/arm64" # 换为实际名称

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
    "${BOLD}${PURPLE} 进入 Nginx 容器 ${RESET}"
    "${BOLD}${PURPLE} 进入 MariaDB 容器 ${RESET}"
    "${BOLD}${PURPLE} 进入 PHP 容器 ${RESET}"
    "${BOLD}${PURPLE} 进入 Redis 容器 ${RESET}"
    "${BOLD}${PURPLE} 进入 phpMyAdmin 容器 ${RESET}\n"
    
    "${BOLD}${RED} 上一级菜单 ${RESET}"
)

# Show 替换为实际名称
function show_goin_container() {
    echo -e "${BOLD}${PURPLE}======== 进入容器 ========${RESET}\n" # 换为实际名称
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${RED}m. ${options[$i]}${RESET}\n"  # 将返回选项标记为红色
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
            echo -e "${BOLD}${YELLOW} 您正处于 Nginx 容器内部 ${RESET}"
            "$DOCKER_COMPOSE_WORKDIR_SCRIPT_PATH"
            docker exec -it sites-nginx-1 /bin/sh
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 您正处于 MariaDB 容器内部 ${RESET}"
            "$DOCKER_COMPOSE_WORKDIR_SCRIPT_PATH"
            docker exec -it sites-mariadb-1 /bin/sh
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 您正处于 PHP 容器内部 ${RESET}"
            "$DOCKER_COMPOSE_WORKDIR_SCRIPT_PATH"
            docker exec -it sites-php-1 /bin/sh
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 您正处于 Redis 容器内部 ${RESET}"
            "$DOCKER_COMPOSE_WORKDIR_SCRIPT_PATH"
            docker exec -it sites-redis-1 /bin/sh
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} 您正处于 phpMyAdmin 容器内部 ${RESET}"
            "$DOCKER_COMPOSE_WORKDIR_SCRIPT_PATH"
            docker exec -it sites-phpmyadmin-1 /bin/sh
        ;;
        M|m)
            clear
            echo "${BOLD}${RED} [Docker-LNMP] ${RESET}"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

# 主循环
while true; do
    show_goin_container # 换为实际名称
    handle_choice
    if [[ $choice == "m" || $choice == "M" ]]; then
        break  # 退出循环，返回到调用的主菜单
    fi
done