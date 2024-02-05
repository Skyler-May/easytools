#!/bin/bash

cd /

# Clone the repository
git clone https://github.com/Sam-Mey/easytools.git

# Find all .sh files and chmod +x
find /easytools -name "*.sh" -exec chmod +x {} \;

# Create a symbolic link for menu.sh
ln -s "/easytools/menu.sh" "/usr/local/bin/et"

# Check if it's not being run for removal
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    rm -rf /root/install.sh
fi

# Run 'et' command (make sure 'et' is set up before this point)
et