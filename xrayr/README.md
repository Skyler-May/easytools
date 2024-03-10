# 一键 Docker 部署 XrayR

### 先决条件

1. vps 1台
2. 做好域名解析
3. 开放端口：`80` 必须，（其他端口根据需要自行开放）
4. 修改 `config.yml` 配置文件。[点击下载](https://github.com/Sam-Mey/some_project/blob/main/XrayR/config.yml)
5. 修改 `docker-compose` 配置文件。[点击下载](https://github.com/Sam-Mey/some_project/blob/main/XrayR/docker-compose.yml)
6. 将 `config.yml` 与 `docker-compose.yml` 上传到 `root` 目录下

### 开启 Ubuntu 系统自带的 BBR 加速
```bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
lsmod | grep bbr
```

## [官方文档](https://xrayr-project.github.io/XrayR-doc/xrayr-xia-zai-he-an-zhuang/install/docker.html)
