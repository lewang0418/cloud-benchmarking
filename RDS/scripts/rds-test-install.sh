#! /bin/bash
set -e

ctx logger info "install"
#sudo apt-get update
#sudo apt-get upgrade -y

# Install sysbench
sudo apt-get install -y sysbench

# Install sshpass
sudo apt-get install -y sshpass

