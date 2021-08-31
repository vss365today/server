#!/usr/bin/env bash
# Create the Caddy logs folder if needed
if [ ! -d "/var/log/caddy" ]; then
  mkdir /var/log/caddy
fi

# Add the folder to the caddy group so logs can be written there
chown -R caddy /var/log/caddy
