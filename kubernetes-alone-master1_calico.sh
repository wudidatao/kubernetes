#!/bin/bash

kubectl apply -f calico/rbac.yaml
kubectl apply -f calico/calico.yaml

sleep 10s

kubectl get pod --all-namespaces -o wide | grep -E "coredns|calico"
