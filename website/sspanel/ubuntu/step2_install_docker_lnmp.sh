#!/bin/bash

# 检查是否安装了 Docker
if command -v docker &> /dev/null; then
    clear
    echo -e "${BOLD}${YELLOW} Docker 已安装，正在创建 LNMP 环境... ${RESET}"
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