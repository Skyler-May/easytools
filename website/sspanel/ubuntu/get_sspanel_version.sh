#!/bin/bash

sudo apt-get update
sudo apt-get install -y jq

# GitHub 仓库地址
repo_url="https://api.github.com/repos/Anankke/SSPanel-Uim/releases/latest"

# 使用 curl 获取 GitHub Releases 信息
api_response=$(curl -s "$repo_url")

# 使用 jq 解析 JSON 数据
release_info=$(echo "$api_response" | jq -r '.tag_name, .body')

# 提取版本号和数据库版本号，并去除前缀
latest_release_version=$(echo "$release_info" | head -n 1 | sed 's/v//')
database_version=$(echo "$release_info" | sed -nE 's/.*配套数据库版本 ```([0-9]+)```.*/\1/p')

# 处理数据库版本为 null 的情况
if [ -z "$database_version" ]; then
    database_version="未指定"
fi

# 生成 update_sspanel.sh 文件
echo "#!/bin/bash" > update_sspanel.sh
echo "" >> update_sspanel.sh
echo "# 进入目录" >> update_sspanel.sh
echo "cd /docker-lnmp/www/sites/sspanel" >> update_sspanel.sh
echo "" >> update_sspanel.sh
echo "# 使用最新版本号和数据库版本号更新 SSPanel-Uim" >> update_sspanel.sh
echo "bash update.sh $latest_release_version $database_version" >> update_sspanel.sh

# # 生成 install_sspanel.sh 文件
# echo "#!/bin/bash" > install_sspanel.sh
# echo "" >> install_sspanel.sh
# echo "# 进入目录" >> install_sspanel.sh
# echo "cd /docker-lnmp/www/sites/sspanel" >> install_sspanel.sh
# echo "" >> install_sspanel.sh
# echo "# 使用指定版本号克隆 SSPanel-Uim 仓库" >> install_sspanel.sh
# echo "git clone -b $latest_release_version https://github.com/Anankke/SSPanel-Uim.git ." >> install_sspanel.sh

# 追加 install_sspanel.sh 文件内容
echo "# 进入目录" >> install_sspanel.sh
echo "cd /docker-lnmp/www/sites/sspanel" >> install_sspanel.sh
echo "" >> install_sspanel.sh
echo "# 使用指定版本号克隆 SSPanel-Uim 仓库" >> install_sspanel.sh
echo "git clone -b $latest_release_version https://github.com/Anankke/SSPanel-Uim.git ." >> install_sspanel.sh

# 输出结果
echo "已将版本信息写入 update_sspanel.sh 文件:"
cat update_sspanel.sh

# echo "已将安装信息写入 install_sspanel.sh 文件:"
# cat install_sspanel.sh

echo "已将版本信息追加至 install_sspanel.sh 文件:"
tail -n 3 install_sspanel.sh  # 显示 install_sspanel.sh 文件的最后3行，确保追加成功
