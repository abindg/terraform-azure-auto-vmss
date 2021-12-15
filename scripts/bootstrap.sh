#!/bin/sh
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html 
sudo echo "Welcome to Abin's lab - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html