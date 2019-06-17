#!/bin/bash

#安装步骤

1.master1 下载脚本代码 修改hosts.sh为自己实际的主机
./hostname.sh 修改主机名
./ssh-copy-id.sh 免密其他主机
./dns.sh #设置解析其他主机
scp -r /root/kubernetes-cluster/ root@harbor.io:/root/ 
scp -r /root/kubernetes-cluster/ root@k8s-harbor1.example.com:/root/
scp -r /root/kubernetes-cluster/ root@k8s-harbor2.example.com:/root/
scp -r /root/kubernetes-cluster/ root@k8s-master2.example.com:/root/
scp -r /root/kubernetes-cluster/ root@k8s-master3.example.com:/root/
scp -r /root/kubernetes-cluster/ root@k8s-worker1.example.com:/root/
scp -r /root/kubernetes-cluster/ root@k8s-worker2.example.com:/root/
scp -r /root/kubernetes-cluster/ root@k8s-worker3.example.com:/root/ 复制项目到所有其他节点上

2.harbor1 单独上传镜像包k8s-repo-1.11.0

3.master1执行 
./base_install_master1.sh
剩余所有节点执行
./base_install.sh

4.workers执行
./ipvsadm.sh 

5.masters执行
./keepalived.sh

6.harbor1执行
./harbor-repo.sh
剩余所有节点执行
./harbor-test.sh

7.所有机器重启
reboot

8.master1执行
./kubernetes-etcd-ha.sh

安装网络之前确保各个节点都是可以调度的
kubectl taint nodes --all node-role.kubernetes.io/master-

创建网络有两种方式
docker pull registry.cn-shenzhen.aliyuncs.com/cp_m/flannel:v0.10.0-amd64
docker tag registry.cn-shenzhen.aliyuncs.com/cp_m/flannel:v0.10.0-amd64 quay.io/coreos/flannel:v0.10.0-amd64
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
#kubectl apply -f flannel/kube-flannel.yml
#kubectl apply -f flannel/kube-flannel-rbac.yml
或者
kubectl apply -f calico/calico.yaml 
kubectl apply -f calico/rbac.yaml

创建可视化界面执行
kubectl apply -f plugin/traefik.yaml
kubectl apply -f plugin/kubernetes-dashboard.yaml
kubectl apply -f plugin/heapster.yaml
kubectl apply -f plugin/rbac.yaml

9.workers根据kubernetes-etcd-ha.sh安装过程中提示的kubeadm join信息加入集群，如果没记住在master1上执行kubeadm token create --print-join-command查看

10.如果master节点在加入集群的过程中出现任何问题，可以在所有master节点上执行kubeadm reset，然后再重新执行第8步创建集群
