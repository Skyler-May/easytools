#!bin/bash

# # 停止 Docker 相关服务
sudo systemctl stop docker
sudo systemctl stop docker.socket

# # 卸载 Docker 和 Docker Compose
sudo apt-get remove -y docker docker-engine docker.io containerd runc docker-compose
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# # 删除 Docker 相关配置文件
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf ~/.docker

# # 删除 Docker 组和用户
sudo groupdel docker
sudo userdel docker
# # 删除 Docker 相关目录
sudo rm -rf /usr/local/bin/docker-compose
sudo rm -rf /usr/local/bin/docker-machine
sudo rm -rf /usr/local/bin/docker

# # 删除 Docker 相关网络配置
sudo ip link delete docker0
# # 删除 Docker 相关缓存文件
sudo rm -rf /var/cache/docker
# # 删除 Docker 相关日志文件
sudo rm -rf /var/log/docker
# # 删除 Docker 相关配置文件
sudo rm -rf /etc/default/docker
sudo rm -rf /etc/systemd/system/docker.service.d

# # 删除无用的依赖包
sudo apt-get autoremove -y
sudo apt-get autoclean
    
# # 确认 Docker 已完全卸载
which docker
docker --version
docker-compose --version 