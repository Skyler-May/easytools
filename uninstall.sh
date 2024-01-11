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
    
    echo "Deleted 'easytools' folder and '/usr/local/bin/et' link."
else
    echo "Could not find 'easytools' folder in any directory."
fi
