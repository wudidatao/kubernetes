#!/bin/bash

echo "同步时间"
yum -y install ntp
systemctl enable ntpd
systemctl start ntpd
ntpdate -u cn.pool.ntp.org
sleep 3s
