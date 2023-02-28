#!/bin/bash

echo '>> CONFIGURING NODE SETUP .....'
cd ~
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo mkdir ~/.npm-global
sudo npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.profile
source ~/.profile
echo '<<   NODE SETUP DONE   >>'