#!/bin/bash

. ./hosts.sh 

#yum install wget -y
#wget https://storage.googleapis.com/harbor-releases/harbor-offline-installer-v1.5.4.tgz
tar -zxvf harbor-offline-installer-v1.5.4.tgz
#rm harbor-offline-installer-v1.5.4.tgz -f
cd harbor

#替换变量
sed -i "s/reg.mydomain.com/$harbor_host2/g" harbor.cfg | grep ^hostname
sed -i "s/http/https/g" harbor.cfg | grep ^ui_url_protocol
sed -i "s/Harbor12345/$harbor_admin_password/g" harbor.cfg | grep ^harbor_admin_password

#配置证书
mkdir -p /data/cert/
cd /data/cert/
openssl genrsa -out server.key 2048
openssl req -x509 -new -nodes -key server.key -subj "/CN=$harbor_host2" -days 7120 -out server.crt
cd -
./install.sh
