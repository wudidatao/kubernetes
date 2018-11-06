#!/bin/bash

echo "关闭swap"
sed -i "s&/dev/mapper/centos-swap&#/dev/mapper/centos-swap&g" /etc/fstab 
sleep 3s
