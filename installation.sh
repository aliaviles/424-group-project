#!/bin/bash

# Update package lists
sudo apt update

# Install Apache
sudo apt install apache2

# Install MySQL
sudo apt install mysql-server

# Install PHP
sudo apt install php libapache2-mod-php php-mysql

# Install OpenSSH Server
sudo apt install openssh-server

# Install IPTables Firewall
sudo apt install iptables-persistent

# Install Snort Intrusion Detection System
sudo apt install snort

# Configure MySQL
# Secure MySQL installation
sudo mysql_secure_installation

# Configure IPTables Firewall
# Allow SSH traffic
sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
# Allow incoming HTTP and HTTPS
sudo iptables -A INPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Save IPTables rules
sudo netfilter-persistent save

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
