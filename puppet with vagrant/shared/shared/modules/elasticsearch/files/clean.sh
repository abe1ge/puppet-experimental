#!/usr/bin/env bash

# File to undo the puppet module for testing

sudo rm /opt/elasticsearch-5.0.1.deb
echo "Removed elasticsearch.deb file from /opt"

sudo dpkg --remove elasticsearch
echo "Uninstalled elasticsearch"
