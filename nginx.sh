#!/bin/bash
sudo apt-get update -y 
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo sed -i 's/Welcome to nginx!/Welcome to DevOps Space!../g'  /var/www/html/*.html