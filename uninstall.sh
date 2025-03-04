#!/bin/bash

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

# 在根目录下递归查找名为 "easytools" 的文件夹
result=$(find / -type d -name "easytools" 2>/dev/null)

if [ -n "$result" ]; then
    # Found 'easytools' folder(s) at:
    echo "${BOLD}${RED} 发现 'easytools' 文件夹（目录）在： ${RESET}"
    
    echo "${BOLD}${RED} $result ${RESET}"
    
    # 删除 'easytools' 文件夹
    rm -rf "$result"
    
    # 删除 '/usr/local/bin/tools' 链接
    rm -f /usr/local/bin/tools
    
    echo "${BOLD}${RED} 删除了 'easytools' 主体 和 'tools' 快捷方式. ${RESET}"
else
    echo "${BOLD}${RED} 在任何目录中找不到关于“easytools”文件夹. ${RESET}"
fi
