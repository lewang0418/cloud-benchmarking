#! /bin/bash
set -e
ctx logger info "start"
# CPU benchmarking
ctx logger info "CPU"
for thread in 1 4 8 16 32 64
do
sysbench --test=cpu --cpu-max-prime=10000 --num-threads=${thread} run > ~/cpu_thread_${thread}.log
done

# Memory benchmarking
ctx logger info "RAM"
for block in 1K 32K 64K 128K 512K 1024K
do
sysbench --test=memory --memory-block-size=${block} --memory-scope=global --memory-total-size=50G --memory-oper=read run > ~/ram_block_${block}.log
sysbench --test=memory --memory-block-size=${block} --memory-scope=global --memory-total-size=50G --memory-oper=write run > ~/ram_block_${block}.log
done

# File system benchmarking
ctx logger info "IO"
for thread in 1 4 8 16 32
do
fio --name fio_test_file --direct=1 --rw=randread --bs=4k --size=1G --numjobs=${thread} --time_based --runtime=60 --group_reporting > ~/io_read_thread_${thread}.log
rm fio_test*

fio --name fio_test_file --direct=1 --rw=randwrite --bs=4k --size=1G --numjobs=${thread} --time_based --runtime=60 --group_reporting > ~/io_write_thread_${thread}.log
rm fio_test*
done

for block_size in 1k 4k 8k 16k 32k 64k
do
fio --name fio_test_file --direct=1 --rw=randread --bs=${block_size} --size=1G --numjobs=4 --time_based --runtime=60 --group_reporting > ~/io_read_block_size_${block_size}.log
rm fio_test*

fio --name fio_test_file --direct=1 --rw=randwrite --bs=${block_size} --size=1G --numjobs=4 --time_based --runtime=60 --group_reporting > ~/io_write_block_size_${block_size}.log
rm fio_test*
done

# Apache benchmarking
ctx logger info "Apache"
for client in 1 32 64 128 256
do
ab -c ${client} -n 1000 http://${server_ip}/ > ~/apache_client_${client}.log
done

# Network benchmarking
# TCP
ctx logger info "TCP"

iperf -c ${server_ip} -t 30 -V -p ${server_port} > ~/throughput_tcp_one_connection.log

for window_size in 1k 4k 8k 16k 32k 64k
do
iperf -c ${server_ip} -t 30 -V -w ${window_size} -p ${server_port} > ~/throughput_tcp_window_size_${window_size}.log
done

for thread in 1 4 8 16 32 64
do
iperf -c ${server_ip} -t 30 -V -P ${thread} -p ${server_port} > ~/throughput_tcp_thread_${thread}.log
done


#UDP
ctx logger info "UDP"
sudo iperf -c ${server_ip} -b 100m -u 60 -V -p ${server_port} > ~/throughput_udp_one_connection.log

for thread in 1 4 8 16 32 64
do
sudo iperf -c ${server_ip} -b 100m -u 60 -V -P ${thread} -p ${server_port} > ~/throughput_udp_thread_${thread}.log
done



