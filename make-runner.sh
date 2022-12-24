#!/usr/bin/env bash
# Create a new user, "runner", for running containers
# and add them to the docker group
# See: https://linoxide.com/use-docker-without-sudo-ubuntu/
useradd -m -g users runner
sudo gpasswd -a runner docker
newgrp docker

# Get our "runner" user's UID and GID and provide them to
# Docker via an unversioned override file
sed -i "s/UID/$(id -u runner)/g" ./docker-compose.override.yml
sed -i "s/GID/$(id -g runner)/g" ./docker-compose.override.yml
