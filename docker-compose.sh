#!/bin/bash

yum install epel-release python34 python34-docker python34-cached_property python34-dockerpty python34-docopt python34-jsonschema python34-setuptools python34-texttable python34-yaml -y
yum makecache fast
rpm -i https://mirrors.aliyun.com/epel/7/aarch64/Packages/d/docker-compose-1.18.0-1.el7.noarch.rpm
