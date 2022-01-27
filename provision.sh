#!/bin/bash

VAGRANT_HOST_DIR=/mnt/host_machine

########################
# Jenkins & Java
########################
echo "Installing Jenkins and Java"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo apt update -y
sudo apt search openjdk
sudo apt install -y openjdk-11-jdk
sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=8181/g' /etc/default/jenkins
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword