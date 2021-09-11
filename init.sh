#!/usr/bin/env bash
# Add ourselves to the docker group
# See: https://linoxide.com/use-docker-without-sudo-ubuntu/
sudo gpasswd -a $USER docker
newgrp docker

# Define user/group vars for docker-compose
# See: https://stackoverflow.com/a/68711840
echo 'export DOCKER_USER="$(id -u):$(id -g)"' >> ~/.bash_profile
source ~/.bash_profile

# Go to the root directory
cd /var/www/vss365today

# Create the required directories
mkdir backup db secrets static
mkdir static/downloads
mkdir static/images
mkdir static/images/temp

# Pull the code
git clone https://github.com/vss365today/web.git
git clone https://github.com/vss365today/api.git
git clone https://github.com/vss365today/finder.git
