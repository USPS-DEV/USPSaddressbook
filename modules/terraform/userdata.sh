#!/bin/bash
# Install dependencies
sudo apt-get update -y
sudo apt-get install -y curl apt-transport-https gnupg lsb-release
sudo apt-get install -y openjdk-21-jdk 

# Download and install HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add HashiCorp official repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null

# Update apt cache and install Terraform
sudo apt-get update
sudo apt-get install terraform -y

#Install unzip and  aws cli
sudo apt install unzip

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
