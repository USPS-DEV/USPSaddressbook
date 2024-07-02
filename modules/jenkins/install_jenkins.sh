#!/bin/bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y curl apt-transport-ht
sudo apt-get -y install openjdk-17-jdk
# Download and install Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/n
# Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/n
# Update apt cache and install Jenkins
sudo apt-get update
sudo apt-get install -y jenkins
#Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins