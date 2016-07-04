#!/bin/bash
ctx logger info "uninstall"
set -e

sshpass -p ${host_password} scp -r ~/cpu* ${host_name}@${host}:~ -o StrictHostKeyChecking=no
sshpass -p ${host_password} scp -r ~/ram* ${host_name}@${host}:~ -o StrictHostKeyChecking=no
sshpass -p ${host_password} scp -r ~/io* ${host_name}@${host}:~ -o StrictHostKeyChecking=no
sshpass -p ${host_password} scp -r ~/throughput_client* ${host_name}@${host}:~ -o StrictHostKeyChecking=no
sshpass -p ${host_password} scp -r ~/apache* ${host_name}@${host}:~ -o StrictHostKeyChecking=no


