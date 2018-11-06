#!/bin/bash

harbor_host1="gcr.io harbor.io k8s.gcr.io quay.io"
harbor_host2="k8s-harbor1.example.com"
harbor_host3="k8s-harbor2.example.com"
master_host1="k8s-master1.example.com"
master_host2="k8s-master2.example.com"
master_host3="k8s-master3.example.com"
worker_host1="k8s-worker1.example.com"
worker_host2="k8s-worker2.example.com"
worker_host3="k8s-worker3.example.com"

harbor_ip1="192.168.1.110"
harbor_ip2="192.168.1.111"
harbor_ip3="192.168.1.112"
master_ip1="192.168.1.113"
master_ip2="192.168.1.114"
master_ip3="192.168.1.115"
worker_ip1="192.168.1.116"
worker_ip2="192.168.1.117"
worker_ip3="192.168.1.118"

vip=192.168.1.120
net_if=eth0
cidr=10.244.0.0/16

harbor_admin_password=123456