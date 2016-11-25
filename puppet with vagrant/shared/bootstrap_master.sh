
sudo apt-get -q update
sudo apt-get -q install -y puppetmaster puppet openssh-server openssh-client
sudo puppet resource package puppetmaster ensure=latest
sudo sed -i "1i127.0.0.1 $(facter fqdn) puppetmaster" /etc/hosts
sudo sed -i "2i$(facter ipaddress_eth1) $(facter fqdn) puppetmaster" /etc/hosts
sudo sed -i "2idns_alt_names = puppet, $(facter fqdn)" /etc/puppet/puppet.conf

sudo cp /tmp/shared/autosigning/autosign /usr/local/bin
sudo echo "autosign = /usr/local/bin/autosign" >> /etc/puppet/puppet.conf
sudo chmod a+x /usr/local/bin/autosign 

sudo cp -r /tmp/shared/modules/* /etc/puppet/modules

AGENT=1
while [ $AGENT -lt 9 ]; do
	sudo echo "node 'tatfbagent$AGENT.qac.local' {" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include apache" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include apt" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include artifactory" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include broccoli" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include elasticsearch" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include gatling" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include git" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include java" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include jenkins" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include kibana" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include logstash" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include mercurial" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include mercurialserver" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include mocha" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include mysql" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include nagios" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include nodejs" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include php" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include rundeck" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include smtp" >> /etc/puppet/manifests/site.pp
	sudo echo "#	include tripwire" >> /etc/puppet/manifests/site.pp
	sudo echo "}" >> /etc/puppet/manifests/site.pp
	let AGENT=AGENT+1
done
