#!/bin/bash

# enter script pwd
cd "$(dirname "${BASH_SOURCE[0]}")"

# script working path
SCRIPT_DIR="/easytools"

ACME_CENTOS_SCRIPT_PATH="$SCRIPT_DIR/acme/acme_centos.sh"
ACME_MENU_SCRIPT_PATH="$SCRIPT_DIR/acme/acme_menu.sh"
ACME_UBUNTU_DEBIAN_SCRIPT_PATH="$SCRIPT_DIR/acme/acme_ubuntu_debian.sh"
ARM64_SCRIPT_PATH="$SCRIPT_DIR/docker/arm64.sh"
CENTOS_SCRIPT_PATH="$SCRIPT_DIR/docker/centos.sh"
COMPOSE_SCRIPT_PATH="$SCRIPT_DIR/docker/compose.sh"
CONFIG_SCRIPT_PATH="$SCRIPT_DIR/config.sh"
DDSYSTEM_SCRIPT_PATH="$SCRIPT_DIR/docker/ddsystem.sh"
DOCKER_COMPOSE_CENTOS_SCRIPT_PATH="$SCRIPT_DIR/XrayR/docker_compose_centos.sh"
INSTALL_SCRIPT_PATH="$SCRIPT_DIR/install.sh"
MENU_SCRIPT_PATH="$SCRIPT_DIR/menu.sh"
RUNXRAYR_SCRIPT_PATH="$SCRIPT_DIR/XrayR/runxrayr.sh"
TEMPLATE_SCRIPT_PATH="$SCRIPT_DIR/template.sh"
UBUNTU_DEBIAN_SCRIPT_PATH="$SCRIPT_DIR/docker/ubuntu_debian.sh"
UNINSTALL_SCRIPT_PATH="$SCRIPT_DIR/uninstall.sh"
UPDATE_SCRIPT_PATH="$SCRIPT_DIR/update.sh"
UPDATE_XRAYR_SCRIPT_PATH="$SCRIPT_DIR/XrayR/update_XrayR.sh"
WARP_CALL_SCRIPT_PATH="$SCRIPT_DIR/warp/warp_call.sh"
WARP_INSTALL_SCRIPT_PATH="$SCRIPT_DIR/warp/warp_install.sh"
WARP_MENU_SCRIPT_PATH="$SCRIPT_DIR/warp/warp_menu.sh"
XRAYR_INSTALL_OPTIONS_SCRIPT_PATH="$SCRIPT_DIR/XrayR/xrayr_install_options.sh"
XRAYR_MENU_SCRIPT_PATH="$SCRIPT_DIR/XrayR/xrayr_menu.sh"

# other config...

# # dev debug
# echo "ACME_CENTOS_SCRIPT_PATH: $ACME_CENTOS_SCRIPT_PATH"
# echo "ACME_MENU_SCRIPT_PATH: $ACME_MENU_SCRIPT_PATH"
# echo "ACME_UBUNTU_DEBIAN_SCRIPT_PATH: $ACME_UBUNTU_DEBIAN_SCRIPT_PATH"
# echo "ARM64_SCRIPT_PATH: $ARM64_SCRIPT_PATH"
# echo "CENTOS_SCRIPT_PATH: $CENTOS_SCRIPT_PATH"
# echo "COMPOSE_SCRIPT_PATH: $COMPOSE_SCRIPT_PATH"
# echo "CONFIG_SCRIPT_PATH: $CONFIG_SCRIPT_PATH"
# echo "DDSYSTEM_SCRIPT_PATH: $DDSYSTEM_SCRIPT_PATH"
# echo "DOCKER_COMPOSE_CENTOS_SCRIPT_PATH: $DOCKER_COMPOSE_CENTOS_SCRIPT_PATH"
# echo "INSTALL_SCRIPT_PATH: $INSTALL_SCRIPT_PATH"
# echo "MENU_SCRIPT_PATH: $MENU_SCRIPT_PATH"
# echo "RUNXRAYR_SCRIPT_PATH: $RUNXRAYR_SCRIPT_PATH"
# echo "TEMPLATE_SCRIPT_PATH: $TEMPLATE_SCRIPT_PATH"
# echo "UBUNTU_DEBIAN_SCRIPT_PATH: $UBUNTU_DEBIAN_SCRIPT_PATH"
# echo "UNINSTALL_SCRIPT_PATH: $UNINSTALL_SCRIPT_PATH"
# echo "UPDATE_SCRIPT_PATH: $UPDATE_SCRIPT_PATH"
# echo "UPDATE_XRAYR_SCRIPT_PATH: $UPDATE_XRAYR_SCRIPT_PATH"
# echo "WARP_CALL_SCRIPT_PATH: $WARP_CALL_SCRIPT_PATH"
# echo "WARP_INSTALL_SCRIPT_PATH: $WARP_INSTALL_SCRIPT_PATH"
# echo "WARP_MENU_SCRIPT_PATH: $WARP_MENU_SCRIPT_PATH"
# echo "XRAYR_INSTALL_OPTIONS_SCRIPT_PATH: $XRAYR_INSTALL_OPTIONS_SCRIPT_PATH"
# echo "XRAYR_MENU_SCRIPT_PATH: $XRAYR_MENU_SCRIPT_PATH"
