#!/bin/bash
# UPDATE
sudo apt-get update 

# DOCKER INSTALL
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# DOCKER-COMPOSE INSTALL
sudo apt-get update
sudo apt-get install docker-compose-plugin

# USE DOCKER WITHOUT SUDO
sudo groupadd docker
sudo usermod -aG docker vagrant
newgrp docker

# VERSION
docker --version
docker compose version