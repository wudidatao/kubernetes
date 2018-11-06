#!/bin/bash

echo "主机名列表"
cat hosts.sh

read -p '请输入当前节点主机名:' hostname
hostnamectl set-hostname $hostname
echo '当前主机名改为'$hostname
