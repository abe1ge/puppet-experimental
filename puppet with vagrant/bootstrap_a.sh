#!/usr/bin/env bash

echo "agent bootstrap"
#update
sudo apt-get update

#install puppet
sudo apt install -y puppet 

#send a request to be signed
sudo puppet agent --test --server=master.local








