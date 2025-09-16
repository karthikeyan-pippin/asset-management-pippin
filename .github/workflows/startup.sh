#!/bin/bash

# Install system updates
sudo apt update -y
sudo apt upgrade -y

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install PM2
sudo npm install -g pm2

# Install Git
sudo apt install -y git

# Ensure app directory exists
sudo mkdir -p /var/www
sudo chmod -R 777 /var/www
cd /var/www

# Clone or update repo
if [ ! -d ".git" ]; then
  echo "📥 Cloning repo"
  git clone https://github.com/karthikeyan-pippin/asset-management-pippin.git . 
else
  echo "📥 Updating repo"
  git fetch origin main && git reset --hard origin/main
fi

# Install app dependencies
npm install

# Start app with PM2
pm2 delete titles-server || true
pm2 start app.js --name "titles-server" --update-env
pm2 save