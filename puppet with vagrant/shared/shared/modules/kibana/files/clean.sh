#!/usr/bin/env bash

# File to undo the puppet module for testing

sudo rm /opt/kibana-5.0.1-amd64.deb
echo "Removed kibana.deb file from /opt"

sudo dpkg --remove kibana
echo "Uninstalled kibana"

sudo rm /usr/local/bin/kibana-config.sh
echo "Removed kibana-config.sh file from /usr/local/bin"