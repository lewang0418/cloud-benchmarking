#! /bin/bash
set -e
ctx logger info "install"
#sudo apt-get update
#sudo apt-get upgrade -y

# Install iperf
sudo apt-get install -y iperf

# Install sshpass
sudo apt-get install -y sshpass

# Install apache
sudo apt-get install -y apache2




