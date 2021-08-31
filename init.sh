#!/usr/bin/env bash
# Go to the root directory
cd /var/www/vss365today

# Create the required directories
mkdir backup db secrets static
mkdir static/images
mkdir static/images/temp
mkdir static/downloads

# Pull the code
git clone https://github.com/vss365today/web.git
git clone https://github.com/vss365today/api.git
git clone https://github.com/vss365today/finder.git
