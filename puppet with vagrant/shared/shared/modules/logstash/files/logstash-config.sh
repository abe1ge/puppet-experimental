#!/usr/bin/env bash

# Bash script to config logstash

# Piping hello world to a simple logstash pipeline for testing
sudo echo "Hello World" | sudo /usr/share/logstash/bin/logstash -f /usr/share/logstash/logstash-simple.conf
echo "Passed a simple 'Hello World' message to logstash then elasticsearch for inspection in Kibana"