#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Java 21 (required for Jenkins)
sudo apt install openjdk-21-jdk -y

# Add Jenkins repository key
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt-get update

# Install Jenkins
sudo apt-get install jenkins -y

# Start and enable Jenkins service
sudo systemctl enable --now jenkins

# Allow Jenkins through firewall
sudo ufw allow 8080/tcp || true

# Check Jenkins status
sudo systemctl is-active --quiet jenkins || sudo systemctl status jenkins