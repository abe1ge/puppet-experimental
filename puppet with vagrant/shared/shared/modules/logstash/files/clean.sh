#!/usr/bin/env bash

# File to undo the puppet module for testing

sudo rm /opt/logstash-5.0.1.deb
echo "Removed logstash.deb file from /opt"

sudo rm /usr/local/bin/logstash-config.sh 
echo "Removed logstash-config.sh from usr/local/bin"

sudo rm /usr/share/logstash/logstash-simple.conf
echo "Removed logstash-simple.conf from usr/share/logstash"

sudo dpkg --remove logstash
echo "Uninstalled logstash"