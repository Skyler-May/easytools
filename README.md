# 欢迎使用 easytools 工具箱

## 首次安装

```bash
curl -O https://raw.githubusercontent.com/Sam-Mey/easytools/main/install.sh \
    && chmod +x install.sh \
    && ./install.sh
```

## 再次只需要 `et` 呼出脚本

## 使用说明：

 1.一键 DOcker 部署 XrayR 需要事先配置好 [config.yml](https://github.com/Sam-Mey/easytools/blob/main/xrayr/config.yml) 并上传到 `root` 目录下，脚本会自动替换原来的；目的是为了脚本一次性执行完毕！

 2.证书申请需要事先开发 `80` 端口，并不能被其他程序占用，成功后将会在 `root/certs` 目录下

 3.warp 解锁 Netflix 是缝合 `第三方大神之作` 介意请勿选择此项。或手动安装（BUG:如安装了`warp 解锁 Netflix`此项，终端键入 `et` 将不会再次跳出 `easytools` 脚本，而是 `warp` 的安装界面）

 4 Docker 部署 LNMP 在开发中...

