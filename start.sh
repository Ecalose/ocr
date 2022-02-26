#!/bin/bash
wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O ttyd
chmod +x ttyd
nohup python3 ocr_server.py --port 9898 --ocr --det >>/dev/null 2>&1 &
nohup ./ttyd -p 8080 -c icarus:rw12345678* bash >>/dev/null 2>&1 &
nginx -c ./nginx.conf
nginx -s reload
