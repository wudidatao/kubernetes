#!/bin/bash

echo "配置kubernetes源"
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
sleep 3s

echo "安装kubelet kubeadm kubectl"
yum install kubelet-1.11.0 kubeadm-1.11.0 kubectl-1.11.0 --disableexcludes=kubernetes -y
systemctl enable kubelet && systemctl start kubelet
sleep 3s
