#!/usr/bin/env bash
# Get our "runner" user's UID and GID and provide them to
# Docker via an unversioned override file
sed -i "s/UID/$(id -u runner)/g" ./docker-compose.override.yml
sed -i "s/GID/$(id -g runner)/g" ./docker-compose.override.yml
