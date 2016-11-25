
sudo apt-get update -y
sudo apt-get install -y puppet openssh-server openssh-client libaio1 libmecab2
sudo sed -i '1s/^/192.168.1.200	tatfbmaster.qac.local	puppetmaster\n/' /etc/hosts
sudo sed -i "2i127.0.0.1 $(facter fqdn) puppet" /etc/hosts
sudo sed -i "3i$(facter ipaddress_eth1) $(facter fqdn) puppet" /etc/hosts
sudo sed -i 's/ain]/ain]\nserver=tatfbmaster.qac.local\n/g' /etc/puppet/puppet.conf
sudo cp /tmp/shared/autosigning/csr_attributes.yaml /etc/puppet
sudo service puppet restart
sudo puppet agent --enable
sudo puppet agent -t
