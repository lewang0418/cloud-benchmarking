#! /bin/bash
ctx logger info "uninstall"
set -e

sshpass -p ${host_password} scp -r ~/mysql* ${host_name}@${host}:~  -o StrictHostKeyChecking=no

