#!/bin/bash

. ./hosts.sh

echo """
CP0_IP=$master_ip1
CP0_HOSTNAME=$master_host1
CP1_IP=$master_ip2
CP1_HOSTNAME=$master_host2
CP2_IP=$master_ip3
CP2_HOSTNAME=$master_host3
VIP=$vip
NET_IF=$net_if
CIDR=$cidr
""" > ./cluster-info

./kubeha-gen.sh
