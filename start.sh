#!/bin/bash


# 检查config配置文件，并创建
if [ ! -e "/config/qBittorrent/config/qBittorrent.conf" ] ;  then 
mkdir -p /config/qBittorrent/config/
cp /usr/local/qbittorrent/defaults/qBittorrent.conf  /config/qBittorrent/config/qBittorrent.conf
fi

# permissions
chown 0777 -R /config \
    /downloads

git clone https://github.com/railway7/qb
chmod 0777 /upload
mv  -n /qb/upload/* /upload/
chmod 0777 /upload/ -R
rm -rf /qb
mkdir /.config/
mkdir /.config/rclone
touch /.config/rclone/rclone.conf
cp /config/rclone/rclone.conf /.config/rclone/


nohup yes "" | qbittorrent-nox --webui-port=$PORT  --profile=/config  &
python3 /upload/config.py
python3 /upload/dingshi.py

