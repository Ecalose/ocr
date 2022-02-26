#!/bin/bash
wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O ttyd
chmod +x ttyd
nohup ./ttyd -p 8080 -c icarus:rw12345678*
nohup python3 ocr_server.py --port 9898 --ocr --det &

rm /etc/nginx/nginx.conf
cp /app/nginx.conf /etc/nginx/
nginx -c /etc/nginx/nginx.conf
nginx -s reload