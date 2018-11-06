#!/bin/bash

. ./hosts.sh
echo "免密"
ssh-keygen -t rsa -P ''

IP="
$harbor_ip1
$harbor_ip2
$harbor_ip3
$master_ip1
$master_ip2
$master_ip3
$worker_ip1
$worker_ip2
$worker_ip3
"

for ip in $IP;
do
  ssh-copy-id root@$ip
done

