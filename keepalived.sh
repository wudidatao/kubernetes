#!/bin/bash

echo "安装keepalived"
yum install keepalived -y
systemctl start keepalived.service
systemctl enable keepalived.service
sleep 3s
