#!/bin/bash

# kill shadowsocks client
ss_config=`ps aux | grep sslocal  | grep -v grep | tr -s ' ' | cut -d" " -f14`
sslocal_pid=`ps aux | grep sslocal  | grep -v grep | tr -s ' ' | cut -d" " -f2`
[[ -n $sslocal_pid ]] && sudo kill $sslocal_pid

# start a new shadowsocks client
# if [[ $ss_config = "/etc/shadowsocks.json" ]]; then
    # nohup sslocal -c /etc/shadowsocks1.json >/dev/null 2>&1 &
# else
    # nohup sslocal -c /etc/shadowsocks.json >/dev/null 2>&1 &
# fi
read -p "Now specify a new shadowsocks config file: " new_config
if [ -f $ss_config ]; then
    nohup sslocal -c $new_config >/dev/null 2>&1 &
else
    echo "$new_config does not exist. Not gonna switch proxy server."
    nohup sslocal -c $ss_config >/dev/null 2>&1 &
fi
