#!/bin/bash

echo "Current directory: $(pwd)"
echo "Environment variables: $(env)"

# Define colors and styles
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

function type_message() {
    message=$1
    for ((i=0; i<${#message}; i++)); do
        echo -n "${BOLD}${YELLOW}${message:$i:1}${RESET}"
        sleep 0.03   # Adjust sleep time to control typing speed
    done
    echo   # Newline
}

# Example message
prompt="由于安装的自动化性质，您需要配置“config.yml”文件并将其上传到“root”目录；有关配置的详细信息，请参阅“XrayR官方网站”或使用该项目中的配置文件（该项目中配置文件与官方文件一致，可以放心使用）."

# Call the function to print the message
type_message "$prompt"

# Prompt user for confirmation
read -p "${BOLD}${YELLOW}Are you ready? (Y/N): ${RESET}" choice

# Convert user input to uppercase
choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')

if [ "$choice" == "Y" ]; then
    # Clone Warehouse
    git clone https://github.com/XrayR-project/XrayR-release
    
    # Define source directories
    source_dir1="/root"
    source_dir2="/easytools/xrayr"
    
    # Define destination directories
    destination_dir1="/root/XrayR-release/config"
    destination_dir2="/root/XrayR-release"
    
    # Check if destination directories exist; if not, create them
    for dest_dir in "$destination_dir1" "$destination_dir2"; do
        if [ ! -d "$dest_dir" ]; then
            echo -e "${RED}Destination directory $dest_dir does not exist; cannot move files.${RESET}"
            exit 1
        fi
    done
    
    # Move config.yml from source_dir1 to destination_dir1
    mv -v "$source_dir1/config.yml" "$destination_dir1"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}config.yml successfully moved to $destination_dir1${RESET}"
    else
        echo -e "${RED}The root directory does not have a config.yml file, you can manually start it${RESET}"
        exit 0
    fi
    
    # Move docker-compose.yml from source_dir2 to destination_dir2
    cp -v "$source_dir2/docker-compose.yml" "$destination_dir2"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}docker-compose.yml successfully copied to $destination_dir2${RESET}"
    else
        echo -e "${RED}Failed to copy docker-compose.yml${RESET}"
        exit 0
    fi
    
    # Execute
    # Specify the path to the XrayR-release directory
    xrayr_release_dir="/root/XrayR-release"
    
    # Change to the XrayR-release directory
    cd "$xrayr_release_dir"
    
    docker-compose -f docker-compose.yml up -d
    
    cd "$root_dir"
    rm -rf install_XrayR.sh
else
    # User chooses not to continue
    echo -e "${YELLOW}Okay, you need to be prepared.${RESET}"
fi
