#!/bin/bash

# 在根目录下递归查找名为 "easytools" 的文件夹
result=$(find / -type d -name "easytools" 2>/dev/null)

if [ -n "$result" ]; then
    echo "Found 'easytools' folder(s) at:"
    echo "$result"
    
    # 删除 'easytools' 文件夹
    rm -rf "$result"
    
    # 删除 '/usr/local/bin/et' 链接
    rm -f /usr/local/bin/et
    
    echo "删除了 'easytools' 主体 和 'et' 快捷方式."
else
    echo "在任何目录中找不到关于“easytools”文件夹."
fi
