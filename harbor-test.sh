#/bin/bash

mkdir -p /etc/docker
echo -e '{\n"insecure-registries":["k8s.gcr.io", "gcr.io", "quay.io"]\n}' > /etc/docker/daemon.json
systemctl restart docker

docker pull k8s.gcr.io/kubernetes-dashboard-amd64:v1.8.3
docker pull k8s.gcr.io/heapster-amd64:v1.4.2
docker pull k8s.gcr.io/heapster-influxdb-amd64:v1.3.3
docker pull k8s.gcr.io/heapster-grafana-amd64:v4.4.3 
docker pull k8s.gcr.io/prometheus:v2.3.1

docker pull k8s.gcr.io/pause-amd64:3.1
docker pull k8s.gcr.io/pause:3.1
      
docker pull k8s.gcr.io/traefik:1.6.5         

docker pull k8s.gcr.io/kube-proxy-amd64:v1.11.0       
docker pull k8s.gcr.io/kube-controller-manager-amd64:v1.11.0       
docker pull k8s.gcr.io/kube-apiserver-amd64:v1.11.0       
docker pull k8s.gcr.io/kube-scheduler-amd64:v1.11.0

docker pull quay.io/calico/node:v3.1.3 
docker pull quay.io/calico/cni:v3.1.3 
docker pull quay.io/calico/typha:v0.7.4
docker pull k8s.gcr.io/coredns:1.1.3  
docker pull k8s.gcr.io/etcd-amd64:3.2.18 

docker images
