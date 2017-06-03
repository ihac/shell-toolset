#!/bin/bash

# TODO usage

hostname=$1
ip=$2
read -p "Please input the default user name: " user

# add in /etc/hosts
echo -e "$ip\t$hostname" >> /etc/hosts

# set default user
echo "Host $hostname" >> ~/.ssh/config
echo -e "    Host\t$hostname" >> ~/.ssh/config
echo -e "    User\t$user" >> ~/.ssh/config

# generate ssh key if not exists
[ -f ~/.ssh/id_rsa.pub ] || ssh-keygen

# push ssh key to remote host
ssh-copy-id $user@$hostname
