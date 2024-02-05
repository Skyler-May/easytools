#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "${BASH_SOURCE[0]}")"

# 保存脚本所在目录的路径
SCRIPT_DIR="/easytools"

CONFIG_SCRIPT_PATH="$SCRIPT_DIR/config.sh"
INSTALL_SCRIPT_PATH="$SCRIPT_DIR/install.sh"
MENU_SCRIPT_PATH="$SCRIPT_DIR/menu.sh"
TEMPLATE_SCRIPT_PATH="$SCRIPT_DIR/template.sh"
UNINSTALL_SCRIPT_PATH="$SCRIPT_DIR/uninstall.sh"
UPDATE_SCRIPT_PATH="$SCRIPT_DIR/update.sh"
ACME_SCRIPT_PATH="$SCRIPT_DIR/ssl/acme.sh"
CENTOS_ACME_SCRIPT_PATH="$SCRIPT_DIR/ssl/centos/centos_acme.sh"
UBUNTU_ACME_SCRIPT_PATH="$SCRIPT_DIR/ssl/ubuntu/ubuntu_acme.sh"
WARP_SCRIPT_PATH="$SCRIPT_DIR/warp/warp.sh"
WEBSITE_MENU_SCRIPT_PATH="$SCRIPT_DIR/website/website_menu.sh"
INSTALL_SCRIPT_PATH="$SCRIPT_DIR/website/v2board/install.sh"
UPDATA_SCRIPT_PATH="$SCRIPT_DIR/website/v2board/updata.sh"

# 其他配置...

# 定义路径
echo "CONFIG_SCRIPT_PATH: $CONFIG_SCRIPT_PATH"
echo "INSTALL_SCRIPT_PATH: $INSTALL_SCRIPT_PATH"
echo "MENU_SCRIPT_PATH: $MENU_SCRIPT_PATH"
echo "TEMPLATE_SCRIPT_PATH: $TEMPLATE_SCRIPT_PATH"
echo "UNINSTALL_SCRIPT_PATH: $UNINSTALL_SCRIPT_PATH"
echo "UPDATE_SCRIPT_PATH: $UPDATE_SCRIPT_PATH"
echo "ACME_SCRIPT_PATH: $ACME_SCRIPT_PATH"
echo "CENTOS_ACME_SCRIPT_PATH: $CENTOS_ACME_SCRIPT_PATH"
echo "UBUNTU_ACME_SCRIPT_PATH: $UBUNTU_ACME_SCRIPT_PATH"
echo "WARP_SCRIPT_PATH: $WARP_SCRIPT_PATH"
echo "WEBSITE_MENU_SCRIPT_PATH: $WEBSITE_MENU_SCRIPT_PATH"
echo "INSTALL_SCRIPT_PATH: $INSTALL_SCRIPT_PATH"
echo "UPDATA_SCRIPT_PATH: $UPDATA_SCRIPT_PATH"
