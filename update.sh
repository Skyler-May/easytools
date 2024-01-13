#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "${BASH_SOURCE[0]}")"

# 检查是否存在旧的 'easytools' 文件夹
if [ -d "easytools" ]; then
    echo "发现旧版本 'easytools' 文件夹，将进行备份并删除..."
    mv easytools "easytools_backup_$(date '+%Y%m%d_%H%M%S')"
fi

# 从仓库获取最新的更改
git clone https://github.com/Sam-Mey/easytools.git

# 找到所有 .sh 文件并添加可执行权限
find easytools -name "*.sh" -exec chmod +x {} \;

# 创建符号链接之前检查是否存在，如果存在则删除
if [ -e "/usr/local/bin/et" ]; then
    echo "删除已存在的 '/usr/local/bin/et'..."
    rm /usr/local/bin/et
fi

# 创建一个新的符号链接
ln -s "$(pwd)/easytools/menu.sh" "/usr/local/bin/et"

# 运行 'et' 命令（确保 'et' 在这一步之前已经设置好）
et
