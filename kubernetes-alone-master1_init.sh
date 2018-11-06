#!/bin/bash

. ./hosts.sh

kubeadm init --kubernetes-version=v1.11.0 --apiserver-advertise-address=$master_ip1 --pod-network-cidr=$cidr
