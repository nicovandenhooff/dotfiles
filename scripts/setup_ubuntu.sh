#!/bin/bash

# terminate script if any errors occur
set -e

# update system
sudo apt-get update && sudo apt-get upgrade -y

# Install common packages
sudo apt-get install -y \
    build-essential \
    ca-certificates \
    cifs-utils \
    curl \
    git \
    gnupg \
    htop \
    keyutils \
    lsb-release \
    mc \
    nano \
    ncdu \
    nfs-common \
    openssh-server \
    openfortivpn \
    tmux \
    vim \
    wget

# python environment setup
if ! command -v python3 &> /dev/null
then
    sudo apt-get install -y python3 python3-pip
else
    echo "Python is already installed."
fi
