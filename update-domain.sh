#!/usr/bin/env bash
sed "s/example.com/${1}/gI" ./Caddyfile.template > Caddyfile
