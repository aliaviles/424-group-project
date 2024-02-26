#!/bin/bash

# Update package lists
sudo apt update

# Install Apache
sudo apt-get install apache2 -yq

# Install MySQL
sudo apt install mysql-server -y

# Install PHP
sudo apt install php libapache2-mod-php php-mysql -y

# Install OpenSSH Server
sudo apt install openssh-server -y

# Install IPTables Firewall
sudo apt install iptables-persistent -y

# Install Snort Intrusion Detection System
sudo apt-get install snort -y

# Start services
sudo systemctl start apache2
sudo systemctl start mysql
sudo systemctl start ssh
sudo systemctl start snort

# Enable services to start on boot
sudo systemctl enable apache2
sudo systemctl enable mysql
sudo systemctl enable ssh
sudo systemctl enable snort
