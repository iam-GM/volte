#!/bin/sh
echo "sdr" | sudo -S apt-get update -y
echo "sdr" | sudo -S apt-get upgrade -y
echo "sdr" | sudo -S apt update -y 
echo "sdr" | sudo -S apt upgrade -y
echo "sdr" | sudo -S apt autoremove -y
echo "sdr" | sudo -S apt autoclean -y
echo "sdr" | sudo -S apt-get install ca-certificates curl gnupg lsb-release
echo "sdr" | sudo -S mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "sdr" | sudo -S apt-get update -y
echo "sdr" | sudo -S apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "sdr" | sudo -S groupadd docker
echo "sdr" | sudo -S usermod -aG docker $USER
newgrp docker 
echo "sdr" | sudo -S systemctl enable docker.service
echo "sdr" | sudo -S systemctl enable containerd.service
echo "sdr" | sudo -S reboot
