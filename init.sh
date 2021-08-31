#!/usr/bin/env bash
# Create the required directories
mkdir backup
mkdir db
mkdir secrets
mkdir static

# Pull the code
git pull https://github.com/vss365today/web.git
git pull https://github.com/vss365today/api.git
git pull https://github.com/vss365today/finder.git
