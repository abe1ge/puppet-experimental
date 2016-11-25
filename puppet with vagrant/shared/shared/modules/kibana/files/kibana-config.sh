#!/usr/bin/env bash
  
# Bash script to config Kibana  

# Allowing remote access to the kibana server
 
sudo sed -i '8iserver.host\:\ "0.0.0.0"' /etc/kibana/kibana.yml 
sudo service kibana restart