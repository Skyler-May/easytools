#!/bin/bash

# Clone the repository
git clone https://github.com/Sam-Mey/easytools.git

# Find all .sh files and chmod +x
find easytools -name "*.sh" -exec chmod +x {} \;

# Create a symbolic link for menu.sh
ln -s "/root/easytools/menu.sh" "/usr/local/bin/et"

# Run 'et' command (make sure 'et' is set up before this point)
et
