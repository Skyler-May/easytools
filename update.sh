#!/bin/bash

# update.sh

# Navigate to the script's directory
cd "$(dirname "${BASH_SOURCE[0]}")"

# Fetch the latest changes from the repository
git pull

# Find all .sh files and chmod +x
find . -name "*.sh" -exec chmod +x {} \;

# Run 'et' command (make sure 'et' is set up before this point)
et
