#!/bin/bash

cat hosts.sh

read -p "请输入你的harbor服务器主机名:" harbor_hostname

mkdir -p /etc/docker/certs.d/$harbor_hostname
scp root@$harbor_hostname:/data/cert/server.crt /etc/docker/certs.d/$harbor_hostname

echo "测试登录 账号admin 密码$harbor_admin_password"
docker login $harbor_hostname
