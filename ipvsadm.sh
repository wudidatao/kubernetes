#!/bin/bash

echo "安装ipvsadm,只有node节点必须安装,master节点可以不装"
yum install ipvsadm -y
sleep 3s
