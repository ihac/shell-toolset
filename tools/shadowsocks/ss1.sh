#!/bin/bash

nohup sslocal -c /etc/shadowsocks1.json >/dev/null 2>&1 &
sudo /Applications/Privoxy/startPrivoxy.sh
