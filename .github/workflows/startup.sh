#!/bin/bash

cd /var
sudo mkdir www
sudo chmod -R 777 /www

sudo apt update
sudo apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

sleep 15

sudo npm install -g pm2
pm2 -v    # Verify PM2 is installed

sleep 15

sudo apt update
sudo apt install -y git

sleep 15

sudo apt update
sudo apt install -y net-tools

sleep 15

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y wget apt-transport-https software-properties-common
wget -q -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
sudo add-apt-repository "deb http://download.webmin.com/download/repository sarge contrib"
sudo apt update
sudo apt install -y webmin

sleep 15

sudo apt update -y
sudo apt install -y curl build-essential
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
source ~/.bashrc
