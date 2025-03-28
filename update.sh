#!/bin/bash

# 保存当前目录
current_dir=$(pwd)

# 设置安装目录
INSTALL_DIR="/easytools"

# 检查并创建临时目录
TMP_DIR="tmp_easytools"
if [ -d "$TMP_DIR" ]; then
    rm -rf "$TMP_DIR"
fi

# 克隆远程仓库到临时目录
git clone https://github.com/Skyler-May/easytools.git "$TMP_DIR"

# 检查克隆是否成功
if [ ! -d "$TMP_DIR" ]; then
    echo -e "\033[31m 错误: 克隆仓库失败! \033[0m"
    exit 1
fi

# 切换到安装目录
cd "$INSTALL_DIR" || {
    echo -e "\033[31m 错误: 无法切换到安装目录! \033[0m"
    exit 1
}

# 拉取远程仓库的最新变更
git fetch origin || {
    echo -e "\033[31m 错误: 无法获取最新更新! \033[0m"
    exit 1
}

# 重置本地仓库到最新的提交
git reset --hard origin/master

# 将所有 .sh 文件添加执行权限
find . -name "*.sh" -exec chmod +x {} \;

# 检查menu.sh是否存在
if [ ! -f "$INSTALL_DIR/menu.sh" ]; then
    echo -e "\033[31m 错误: menu.sh 文件不存在! \033[0m"
    exit 1
fi

# 更新符号链接
if [ -L "/usr/local/bin/tools" ]; then
    rm -f "/usr/local/bin/tools"
fi

ln -sf "$INSTALL_DIR/menu.sh" "/usr/local/bin/tools"

# 验证符号链接
if [ ! -L "/usr/local/bin/tools" ]; then
    echo -e "\033[31m 错误: 更新符号链接失败! \033[0m"
    exit 1
fi

# 用最新内容替换当前目录的文件
rsync -av --exclude='.git' "$TMP_DIR/" .

# 切换回原始目录
cd "$current_dir" || exit

# 清理临时目录
rm -rf "$TMP_DIR"

# 检查tools命令是否可执行
if ! command -v tools &> /dev/null; then
    echo -e "\033[31m 错误: tools 命令未能正确更新! \033[0m"
    exit 1
fi

# 运行tools命令
tools