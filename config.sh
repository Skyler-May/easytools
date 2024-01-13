#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "${BASH_SOURCE[0]}")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/root/easytools"

# 定义其他路径
MENU_SCRIPT_PATH="$SCRIPT_DIR/menu.sh"
WEBSITE_MENU_SCRIPT_PATH="$SCRIPT_DIR/website/website_menu.sh"
UNINSTALL_SCRIPT_PATH="$SCRIPT_DIR/uninstall.sh"
UPDATE_SCRIPT_PATH="$SCRIPT_DIR/update.sh"
# 添加其他路径...

# 其他配置...

# 打印调试信息
echo "SCRIPT_DIR: $SCRIPT_DIR"
echo "MENU_SCRIPT_PATH: $MENU_SCRIPT_PATH"
echo "WEBSITE_MENU_SCRIPT_PATH: $WEBSITE_MENU_SCRIPT_PATH"
echo "UNINSTALL_SCRIPT_PATH: $UNINSTALL_SCRIPT_PATH"
echo "UPDATE_SCRIPT_PATH: $UPDATE_SCRIPT_PATH"
