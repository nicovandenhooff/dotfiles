#!/bin/bash

# terminate script if any errors occur
set -e

# update package index
echo "Updating package index..."
sudo apt-get update

# add Docker's official GPG key
echo "Adding Docker's GPG key..."
sudo install -y -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# add the Docker repository to Apt sources
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install Docker packages
echo "Installing Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# restart Docker service to ensure it's running
echo "Restarting Docker service..."
sudo systemctl restart docker

# test Docker installation
echo "Testing Docker installation..."
sudo docker run hello-world

# add current user to the Docker group (optional)
echo "Adding current user to the Docker group..."
sudo usermod -aG docker $USER
echo "Please log out and log back in to apply Docker group changes."