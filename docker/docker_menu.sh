#!/bin/bash

clear

# 进入脚本所在目录
cd "$(dirname "$0")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/easytools/docker"

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
    "${BOLD}${BLUE} ARM64 系统安装 Docker ${RESET}"
    "${BOLD}${BLUE} CentOS 系统安装 Docker ${RESET}"
    "${BOLD}${BLUE} 安装 Docker Compose ${RESET}"
    "${BOLD}${BLUE} 检测系统并安装 Docker ${RESET}"
    "${BOLD}${BLUE} Ubuntu/Debian 系统安装 Docker ${RESET}\n"

    "${BOLD}${RED} 卸载 Docker 与 Docker-Compose ${RESET}"
    "${BOLD}${RED} 主菜单 ${RESET}"
)

# Show menu
function show_docker_menu() {
    echo -e "${BOLD}${BLUE}======== Docker 安装菜单 ========${RESET}\n"
    for i in "${!options[@]}"; do
        if [[ $i -eq $(( ${#options[@]} - 2 )) ]]; then
            echo -e "${BOLD}${RED}d. 卸载 Docker 与 Docker-Compose${RESET}"
        elif [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
            echo -e "${BOLD}${RED}b. 主菜单 ${options[$i]}${RESET}\n"  # 将返回选项标记为红色
        else
            echo -e "${BOLD}${BLUE}$((i+1)). ${options[$i]}${RESET}"
        fi
    done
}

# Handle user choice
function docker_menu_choice() {
    read -p "${BOLD}${BLUE} 请输入选项编号: ${RESET}" choice
    case $choice in
        1)
            clear
            echo -e "${BOLD}${YELLOW} ARM64 系统安装 Docker ${RESET}"
            "$ARM64_SCRIPT_PATH"
        ;;
        2)
            clear
            echo -e "${BOLD}${YELLOW} CentOS 系统安装 Docker ${RESET}"
            "$CENTOS_SCRIPT_PATH"
        ;;
        3)
            clear
            echo -e "${BOLD}${YELLOW} 安装 Docker Compose ${RESET}"
            "$COMPOSE_SCRIPT_PATH"
        ;;
        4)
            clear
            echo -e "${BOLD}${YELLOW} DD系统 安装 Docker ${RESET}"
            "$DDSYSTEM_SCRIPT_PATH"
        ;;
        5)
            clear
            echo -e "${BOLD}${YELLOW} Ubuntu/Debian 系统安装 Docker ${RESET}"
            "$UBUNTU_DEBIAN_SCRIPT_PATH"
        ;;
        d|D)
            clear
            echo -e "${BOLD}${RED} 卸载 Docker 与 Docker-Compose ${RESET}"
            "$UNINSTALL_DOCKER_SCRIPT_PATH"
        b|B)
            clear
            echo "${BOLD}${WHITE} 返回主菜单！ ${RESET}"
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
        ;;
    esac
}

while true; do
    show_docker_menu
    docker_menu_choice
    if [[ $choice == "b" || $choice == "B" ]]; then
        break
    fi
done