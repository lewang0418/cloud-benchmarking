#!/bin/bash
ctx logger info "uninstall"

set -e
TCP_PID=$(ctx instance runtime_properties tcp_pid)
UDP_PID=$(ctx instance runtime_properties udp_pid)

kill -9 ${TCP_PID}
kill -9 ${UDP_PID}

sshpass -p ${host_password} scp -r ~/throughtput_server* ${host_name}@${host}:~  -o StrictHostKeyChecking=no

