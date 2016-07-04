#! /bin/bash
set -e
ctx logger info "start"

# Network benchmarking
#TCP
TCP_COMMAND="sudo iperf -s -V -p ${server_port}"

ctx logger info "${TCP_COMMAND}"
nohup ${TCP_COMMAND} > ~/throughput_server_tcp.log 2>&1 &
TCP_PID=$!

ctx instance runtime_properties tcp_pid ${TCP_PID}


#UDP
UDP_COMMAND="sudo iperf -s -u -V -p ${server_port}"

ctx logger info "${UDP_COMMAND}"
nohup ${UDP_COMMAND} > ~/throughput_server_udp.log 2>&1 &
UDP_PID=$!

ctx instance runtime_properties udp_pid ${UDP_PID}

