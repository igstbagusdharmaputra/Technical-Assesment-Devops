#!/bin/bash

KUBERNETES_VERSION = "1.23.3"
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl wget apt-transport-https conntrack
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get install -y docker-ce
sudo systemctl start docker
sudo usermod -a -G docker vagrant

curl -q -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.23.3/bin/linux/amd64/kubectl 2>/dev/null && chmod +x kubectl
sudo mv kubectl /usr/local/bin/