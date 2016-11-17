#Installing on Debian and Ubuntu
For Debian and Ubuntu, the puppet package contains the Puppet agent, and the puppetmaster package contains the
master. On the master, you need to install this:
	
	$ apt-get install puppet puppetmaster
	# On the agent, you only need to install the puppet package:
	$ apt-get install puppet

Installing the puppet, puppetmaster, and facter packages will also install some prerequisite packages, such
as Ruby itself, if they are not already installed.

<h2> For the latest version of Puppet you can use the following Puppetlabs repositories:</h2>
Debian Wheezy:

	$ wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
	$ dpkg -i puppetlabs-release-wheezy.deb
	$ apt-get update

Ubuntu Precise:

	$ wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
	$ dpkg -i puppetlabs-release-precise.deb
	$ apt-get update
Replace “precise” with other code names for different versions of Debian and Ubuntu.

<h2> Installing from Source </h2>

First, download the Facter tarball from the Puppet Labs site

	$ cd /tmp
	$ wget http://downloads.puppetlabs.com/facter/facter-1.6.18.tar.gz
 Unpack the tarball and run the install.rb script to install Facter:

	$ tar -zxf facter-1.6.18.tar.gz
	$ cd facter-1.6.18
	$ ./install.rb
This will install Facter into the default path for Ruby libraries on your host, for example /usr/lib/ruby/ on many
Linux distributions.

Next, download and install Puppet using the same process:

	$ cd /tmp
	$ wget http://downloads.puppetlabs.com/puppet/puppet-3.1.1.tar.gz
	$ tar -zxf puppet-3.1.1.tar.gz
	$ cd puppet-3.1.1
	$ ./install.rb

# Configuring Puppet
<b> this examples was created on ubuntu:14.04, some lines may need to be changed depenidng on your operating system </b>

The puppet master contains the configuration data and puppet agents <b>connects via SSL</b> and pulls down the required configurations.
on most platforms including the one used in this example the <b>configuration is located in /etc/puppet</b> directory. puppet's preinciple configuration file is called <b>puppet.conf</b> and will be automaticly created when you install puppet, if not you can use the following command to create a simple file.

	$ cd /etc/puppet/
	$ puppet master --genconfig > puppet.conf

The puppet.conf file like an <a href="https://en.wikipedia.org/wiki/INI_file">INI-style configuration file.</a> 

eddit the puppet.conf file to include you fqdn under the main section link so. 

	#to find out your fully qualified domain name (FQDN) you can use facter like so
	$ facter fqdn
	master.local
	
	#edit the puppet.conf to include the following like
	[main]
	server=master.local
	
	#if the main section dosn't already exitst add it.

it is also recommended that you create a DNS CNAME for puppet master

	# add the following like like so in /etc/hosts
	# <master ip>	<master fqdn>	puppetmaster
	192.168.1.91	master.local	puppetmaster
	
now we are going to create and eddit the site.pp file. The site.pp file tells Puppet where and what configuration to load for our clients. This file should be stored under the /etc/puppet/manifests directory. go into the directory and create the file.

	$ touch /etc/puppet/manifests/site.pp

we will insert configuration later but it just need to be present.

<h2>Firewall configuration</h2>

Puppet master runs on TCP port 8140. therfoer this port needs to be opened on the masters firewall and the master must be able to connect to it. we can do this using the following command.
	
	#this allows access from anywhere to the port 8140, this should be eddited so it only grant access to the computers you want		access to the puppetmaster
	$ sudo iptables -A INPUT -p tcp -m state --state NEW --dport 8140 -j ACCEPT
	
	#to restrict access to a certin subnet the following lines can be used
	$ iptables -A INPUT -p tcp -m state --state NEW -s 192.168.0.0/24 --dport 8140 -j ACCEPT
	
	
Now that we are ready we start the puppet master with  service puppetmaster start

	$  service puppetmaster start
	
	#out put from daemon can be seen in /var/log/syslog
	
	#for debuging you can run puppet in the command line like so
	$ puppet master --verbose --no-daemonize
	
	# --verbose option outputs all the logging and you can also add --debug for more output

<h3> Certificates </h3>
Starting the daemon will initiate your Puppet environment, create a local Certificate Authority (CA), along with
certificates and keys for the master, and open the appropriate network socket to await client connections. You can see
Puppet’s SSL information and certificates in the /var/lib/puppet/ssl directory.

The directory on the master contains your CA, certificate requests from your clients, a certificate for your master,
and certificates for all your clients.

for security reasons you may want change where your certificate is stored and this can be done in the puppet.conf file by changing the ssldir option under main.

