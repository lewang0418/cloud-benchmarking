#! /bin/bash
set -e
ctx logger info "install"
#sudo apt-get update
#sudo apt-get upgrade -y

# Install iperf
sudo apt-get install -y iperf

# Install sysbench
sudo apt-get install -y sysbench

# Install fio
sudo apt-get install -y fio

# Install sshpass
sudo apt-get install -y sshpass

# Install apache utils
sudo apt-get install -y apache2-utils

