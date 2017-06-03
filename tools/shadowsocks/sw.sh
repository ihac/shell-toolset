#!/bin/bash

# kill shadowsocks client
ss_config=`ps aux | grep sslocal  | grep -v grep | tr -s ' ' | cut -d" " -f14`
sslocal_pid=`ps aux | grep sslocal  | grep -v grep | tr -s ' ' | cut -d" " -f2`
sudo kill $sslocal_pid

# start a new shadowsocks client
if [[ $ss_config = "/etc/shadowsocks.json" ]]; then
    nohup sslocal -c /etc/shadowsocks1.json >/dev/null 2>&1 &
else
    nohup sslocal -c /etc/shadowsocks.json >/dev/null 2>&1 &
fi

