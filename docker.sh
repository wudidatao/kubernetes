#!/bin/bash

echo "卸载默认docker，生产慎用"
yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
sleep 3s

echo "配置docker阿里源"
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast

echo "安装docker服务"
yum install -y docker-ce
sleep 3s

echo "修改docker默认镜像仓库，改为163的源"
sed -i "s#ExecStart=/usr/bin/dockerd#ExecStart=/usr/bin/dockerd --registry-mirror=https://pee6w651.mirror.aliyuncs.com#g" /lib/systemd/system/docker.service 
sleep 3s

echo "配置docker服务"
systemctl daemon-reload
systemctl enable docker.service
systemctl restart docker.service
sleep 3s

echo "docker服务测试"
docker ps -a
sleep 3s
