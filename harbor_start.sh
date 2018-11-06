#!/bin/bash

cd harbor

docker-compose up -d

sleep 5s

docker ps -a
