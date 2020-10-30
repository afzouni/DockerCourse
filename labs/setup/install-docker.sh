#!/usr/bin/env sh
# Install Docker on ubuntu 20.04

# Add shecan
iface_name=`ip -o link show |  awk '{print $2}' | grep -v lo | cut -d":" -f1 | head -n 1`
resolvectl dns $iface_name 178.22.122.100 185.51.200.2

# Ref: https://docs.docker.com/engine/install/ubuntu/
# Setup Repository
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Restart Docker
sudo systemctl daemon-reload
sudo systemctl restart docker

exit 0
