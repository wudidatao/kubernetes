#!/bin/bash

. ./hosts.sh

echo """
$harbor_ip1 $harbor_host1
$harbor_ip2 $harbor_host2
$harbor_ip3 $harbor_host3
$master_ip1 $master_host1 
$master_ip2 $master_host2
$master_ip3 $master_host3
$worker_ip1 $worker_host1
$worker_ip2 $worker_host2
$worker_ip3 $worker_host3
""" >> /etc/hosts
