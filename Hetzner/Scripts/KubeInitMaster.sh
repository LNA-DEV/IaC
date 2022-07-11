#! /bin/bash
sudo apt-get update
sudo apt-get upgrade -y

swapoff -a; sed -i '/swap/d' /etc/fstab

# Install Docker
sudo apt-get update
sudo apt-get install \
   ca-certificates \
   curl \
   gnupg \
   lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Install Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y kubeadm kubelet kubectl -y #Removed version

# Cluster init
publicIp=$(curl ipinfo.io/ip)
kubeadm init --apiserver-advertise-address=$publicIp --pod-network-cidr=10.0.1.0/24  --ignore-preflight-errors=all

# Join Nodes
kubeadm token create --print-join-command > join.txt
sudo apt-get install netcat
sleep 60
netcat [ip-address] 5789 <join.txt