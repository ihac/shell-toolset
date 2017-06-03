#!/bin/bash

nohup sslocal -c /etc/shadowsocks.json >/dev/null 2>&1 &
sudo /Applications/Privoxy/startPrivoxy.sh
