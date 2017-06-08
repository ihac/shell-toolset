#!/bin/bash

nohup sslocal -c /etc/shadowsocks2.json >/dev/null 2>&1 &
sudo /Applications/Privoxy/startPrivoxy.sh
