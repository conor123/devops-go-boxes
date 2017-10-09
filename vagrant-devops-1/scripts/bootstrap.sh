#!/bin/bash

# Initialise Box
set -x
apt-get update

# Script Variables
TERRAFORM_VERSION="0.10.5"

# Fix date time server drift
apt install ntp -y
service ntp stop
ntpd -gq
service ntp start

# Install git
apt-get install git

# Create ssh key
[[ ! -f /home/ubuntu/.ssh/mykey ]] \
&& mkdir -p /home/ubuntu/.ssh \
&& ssh-keygen -f /home/ubuntu/.ssh/mykey -N '' \
&& chown -R ubuntu:ubuntu /home/ubuntu/.ssh

# Install pip
pip install -U pip && pip3 install -U pip
if [[ $? == 127 ]]; then
    wget -q https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    python3 get-pip.py
fi

# Install awscli and ebcli
pip install -U awscli
pip install -U awsebcli

# Install Terraform
T_VERSION=$(terraform -v | head -1 | cut -d ' ' -f 2 | tail -c +2)
T_RETVAL=${PIPESTATUS[0]}

[[ $T_VERSION != $TERRAFORM_VERSION ]] || [[ $T_RETVAL != 0 ]] \
&& wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install Docker
apt-get -y install docker.io unzip
usermod -G docker ubuntu

# Install Chef SDK (add -v 0.18.30) to specify a version, or else it will be latest stable
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable

# Clean up box
apt-get clean
