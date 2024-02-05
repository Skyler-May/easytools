#!/bin/bash

echo "停止所有容器..."
docker stop $(docker ps -aq) 2>/dev/null

echo "删除所有容器..."
docker rm -f $(docker ps -aq) 2>/dev/null

echo "删除所有镜像..."
docker rmi -f $(docker images -aq) 2>/dev/null

echo "清理网络..."
docker network prune -f
