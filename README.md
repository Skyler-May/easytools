# 此脚本 easytools 正在开发中...

## 首次安装

```bash
git clone https://github.com/Sam-Mey/easytools.git \
    && find easytools -name "*.sh" -exec chmod +x {} \; \
    && ln -s /root/easytools/menu.sh /usr/local/bin/et
```

## 再次只需要 `et` 呼出脚本




    # for i in "${!options[@]}"; do
    #     if [[ $i -eq $(( ${#options[@]} - 1 )) ]]; then
    #         echo -e "${BOLD}${RED}0. ${options[$i]}${RESET}\n"  # 将退出选项标记为红色
    #     else
    #         echo -e "${BOLD}${GREEN}$((i+1)). ${options[$i]}${RESET}"
    #     fi
    # done