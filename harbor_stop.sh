#!/bin/bash

cd harbor

docker-compose stop

sleep 5s

docker ps -a
