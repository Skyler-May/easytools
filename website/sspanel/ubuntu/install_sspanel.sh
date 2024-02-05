#!/bin/bash

host="localhost"

# 检查80端口
check_port() {
    port=$1
    timeout 1 bash -c "</dev/tcp/$host/$port" >/dev/null 2>&1 && echo "Port $port is open" || echo "Port $port is closed"
}

check_port 80
check_port 443

