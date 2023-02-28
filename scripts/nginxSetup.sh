#!/bin/bash


echo '>> CONFIGURING NGINX SETUP.....'
sudo apt-get update
sudo apt-get -y install nginx
sudo systemctl start nginx
echo '<<<   NGINX SETUP DONE   >>>'
