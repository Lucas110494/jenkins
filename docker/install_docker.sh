#!/bin/bash

# this script is only tested on ubuntu focal 20.04 (LTS)

# install docker
echo "##############################################"
echo "############# UPDATE AND UPGRADE #############"
echo "##############################################"
sudo apt-get update
sudo apt-get full-upgrade
echo "##############################################"
echo "################# INSTALL GIT ################"
echo "##############################################"
sudo apt-get install git net-tools
echo "##############################################"
echo "############### INSTALL DOCKER ###############"
echo "##############################################"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

echo "##############################################"
echo "########### INSTALL DOCKER COMPOSE ###########"
echo "##############################################"

sudo apt install python3-pip
sudo pip install docker-compose

echo "##############################################"
echo "########## CREATE JENKINS HOME DIR ###########"
echo "##############################################"

mkdir -p /var/jenkins_home
sudo chown a+wr /var/jenkins_home