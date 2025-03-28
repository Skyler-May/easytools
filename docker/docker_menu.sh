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

# Function to check Docker status
check_docker_status() {
    if command -v docker &> /dev/null; then
        local version=$(docker --version)
        local status=$(docker info 2>/dev/null | grep "Server Version" || echo "Docker 服务未运行")
        echo -e "\n${BOLD}${GREEN}Docker 状态:${RESET}"
        echo -e "${GREEN}$version${RESET}"
        echo -e "${GREEN}$status${RESET}\n"
    else
        echo -e "\n${BOLD}${RED}Docker 未安装${RESET}\n"
    fi
}

# Define menu options
options=(
    "${BOLD}${BLUE}=== Docker 安装 ===${RESET}"
    "${BOLD}${BLUE}1. ARM64 系统安装 Docker ${RESET}"
    "${BOLD}${BLUE}2. CentOS 系统安装 Docker ${RESET}"
    "${BOLD}${BLUE}3. 安装 Docker Compose ${RESET}"
    "${BOLD}${BLUE}4. 检测系统并安装 Docker ${RESET}"
    "${BOLD}${BLUE}5. Ubuntu/Debian 系统安装 Docker ${RESET}\n"

    "${BOLD}${GREEN}=== Docker 管理 ===${RESET}"
    "${BOLD}${GREEN}6. 查看运行中的容器${RESET}"
    "${BOLD}${GREEN}7. 查看所有容器${RESET}"
    "${BOLD}${GREEN}8. 查看本地镜像${RESET}\n"

    "${BOLD}${RED}=== 系统操作 ===${RESET}"
    "${BOLD}${RED}d. 卸载 Docker 与 Docker-Compose${RESET}"
    "${BOLD}${RED}r. 重启 Docker 服务${RESET}"
    "${BOLD}${RED}b. 返回主菜单${RESET}"
)

# Show menu
function show_docker_menu() {
    clear
    check_docker_status
    echo -e "${BOLD}${BLUE}======== Docker 管理菜单 ========${RESET}\n"
    for i in "${!options[@]}"; do
        echo -e "${options[$i]}"
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
        6)
            clear
            docker ps || echo -e "${BOLD}${RED}Docker 服务未运行${RESET}"
            read -p "按回车键继续..."
        ;;
        7)
            clear
            docker ps -a || echo -e "${BOLD}${RED}Docker 服务未运行${RESET}"
            read -p "按回车键继续..."
        ;;
        8)
            clear
            docker images || echo -e "${BOLD}${RED}Docker 服务未运行${RESET}"
            read -p "按回车键继续..."
        ;;
        d|D)
            clear
            echo -e "${BOLD}${RED} 卸载 Docker 与 Docker-Compose ${RESET}"
            "$UNINSTALL_DOCKER_SCRIPT_PATH"
        ;;
        r|R)
            clear
            echo -e "${BOLD}${YELLOW} 重启 Docker 服务 ${RESET}"
            systemctl restart docker || service docker restart
            echo -e "${BOLD}${GREEN} Docker 服务已重启 ${RESET}"
            sleep 2
        ;;
        b|B)
            clear
            echo "${BOLD}${WHITE} 返回主菜单！ ${RESET}"
            return
        ;;
        *)
            clear
            echo -e "${BOLD}${RED} 无效选项，请重新选择 ${RESET}"
            sleep 1
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