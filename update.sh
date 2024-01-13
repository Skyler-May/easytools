#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "${BASH_SOURCE[0]}")"

# 检查是否存在 'easytools' 文件夹，如果不存在，则进行克隆
if [ ! -d "easytools" ]; then
    echo "未找到 'easytools' 文件夹，将进行克隆..."
    git clone https://github.com/Sam-Mey/easytools.git
else
    echo "发现 'easytools' 文件夹，将进行更新..."
    cd easytools
    git pull
    cd ..
fi

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
