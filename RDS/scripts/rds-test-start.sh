#! /bin/bash
ctx logger info "start"

# MySQL benchmarking prepare 
ctx logger info "MySQL benchmarking prepare"
sysbench --test=oltp --oltp-table-size=100000 --mysql-db=${db} --mysql-host=${host} --mysql-port=${port} --mysql-user=${user} --mysql-password=${password} prepare

##Read-Only Test
ctx logger info "Read-Only Test"
for i in 1 2 3 4 5
do
sysbench --test=oltp --oltp-table-size=100000 --mysql-db=${db}  --mysql-host=${host} --mysql-user=${user} --mysql-password=${password} --max-time=60 --oltp-read-only=on --max-requests=0 --num-threads=8 run > ~/mysql_read_only_${i}.log
done

##Mixed Test
ctx logger info "Mixed Test"
for i in 1 2 3 4 5
do
sysbench --test=oltp --oltp-table-size=100000 --mysql-db=${db}  --mysql-host=${host} --mysql-user=${user} --mysql-password=${password} --max-time=60 --max-requests=0 --num-threads=8 run > ~/mysql_read_write_${i}.log
done

##Thread Test
ctx logger info "Thread Test"
for thread in 32 64 128 150
do
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=${db} --mysql-host=${host} --mysql-port=${port} --mysql-user=${user} --mysql-password=${password} --max-time=60 --max-requests=0 --num-threads=${thread} run > ~/mysql_thread_${thread}.log
done

##16 threads, Random connect / disconnect for threads
ctx logger info "16 threads, Random connect / disconnect for threads"
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=${db} --mysql-host=${host} --mysql-port=${port} --mysql-user=${user} --mysql-password=${password} --max-time=60 --max-requests=0 --num-threads=16 --oltp-reconnect-mode=random run > ~/mysql_connect_disconnect.log


## clean up
ctx logger info "clean up"
sysbench --test=oltp --mysql-db=${db} --mysql-host=${host} --mysql-port=${port} --mysql-user=${user} --mysql-password=${password} cleanup
