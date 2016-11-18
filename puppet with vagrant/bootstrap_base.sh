#!/usr/bin/env bash

echo "base bootstrap"

#update
sudo apt-get update

#add DNS CNAME of master to master and agents to /etc/hosts
sudo sed -i "1i192.168.1.91    master.local    puppet" /etc/hosts


