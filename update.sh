#!/bin/bash

# update.sh

# 1. 克隆远程仓库
git clone https://github.com/Sam-Mey/easytools.git tmp_easytools

# 2. 拉取远程仓库的最新变更
git --git-dir=tmp_easytools/.git --work-tree=tmp_easytools fetch origin

# 3. 重置本地仓库到最新的提交
git --git-dir=tmp_easytools/.git --work-tree=tmp_easytools reset --hard origin/master

# 4. 将所有 .sh 文件添加执行权限
find tmp_easytools -name "*.sh" -exec chmod +x {} \;

# 5. 创建符号链接，使得 'et' 命令指向 menu.sh
ln -sf "/easytools/menu.sh" "/usr/local/bin/et"

# 6. 用最新内容替换当前目录的文件
rsync -av --exclude='.git' tmp_easytools/ /easytools/

# 7. 清理临时目录
rm -rf tmp_easytools

# 8. 运行 'et' 命令（确保 'et' 在这一步之前已经设置好）
et

# 打印调试信息
# echo "Cloning the repository..."
# echo "Fetching the latest changes..."
# echo "Resetting local repository to the latest commit..."
# echo "Adding execute permissions to .sh files..."
# echo "Creating symbolic link for menu.sh..."
# echo "Replacing current content with updated content..."
# echo "Cleaning up temporary directory..."
# echo "Running 'et' command..."