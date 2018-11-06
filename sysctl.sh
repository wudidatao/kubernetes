#!/bin/bash

echo "内核参数修改"
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
cat <<EOF > /etc/sysctl.conf 
net.ipv4.ip_nonlocal_bind = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_timestamps = 0
net.ipv4.ip_forward = 1
net.ipv4.tcp_tw_recycle = 0
EOF
sysctl --system
sleep 3s
