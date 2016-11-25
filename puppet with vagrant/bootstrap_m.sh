#!/usr/bin/env bash
echo "master bootstrap"
#update
#sudo apt-get update

#install puppet
sudo apt-get install -y puppet puppetmaster 

#insert fqdn into /etc/puppet/puppet.conf
sudo sed -i '2iserver=master.local' /etc/puppet/puppet.conf


#Firewall configuration
#this allows access from anywhere to the port 8140, this should be eddited so it only grant access to the computers you want access to the puppetmaster
sudo iptables -A INPUT -p tcp -m state --state NEW --dport 8140 -j ACCEPT

#to restrict access to a certin subnet the following lines can be used
sudo iptables -A INPUT -p tcp -m state --state NEW -s 192.168.0.0/24 --dport 8140 -j ACCEPT

sudo cp -r /tmp/shared/puppet/manifests/site.pp /etc/puppet/manifests/

sudo cp -r /tmp/shared/puppet/modules/* /etc/puppet/modules/
