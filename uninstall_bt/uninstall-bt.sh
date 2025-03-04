/etc/init.d/bt stop
rm -rf /www/server/panel
rm -f /etc/init.d/bt

rm -rf /www/wwwroot
rm -rf /www/server/data

rm -rf /www/server/nginx
rm -rf /www/server/apache
rm -rf /www/server/mysql
rm -rf /www/server/php

update-rc.d -f bt remove

rm -rf /www/server/pass.pl           # 面板密码文件
rm -rf /www/server/stop              # 停止标记文件
rm -rf /www/server/total             # 监控相关文件
rm -rf /www/backup                   # 备份目录

apt remove nginx apache2 mysql-server php -y

ps -ef | grep bt | grep -v grep | awk '{print $2}' | xargs kill -9

ls /www/server/panel

/etc/init.d/bt status

# 询问用户是否需要重启系统
echo -e "\033[33m是否需要重启系统？[y/N]\033[0m"
read -r choice
if [[ $choice =~ ^[Yy]$ ]]; then
    reboot
fi

