#!/usr/bin/env bash
# Create root directory
mkdir -p /var/www/vss365today
cd /var/www/vss365today

# Create the required directories
mkdir backup
mkdir db
mkdir secrets
mkdir static

# Pull the code
git pull https://github.com/vss365today/web.git
git pull https://github.com/vss365today/api.git
git pull https://github.com/vss365today/finder.git
git pull https://github.com/vss365today/server.git
