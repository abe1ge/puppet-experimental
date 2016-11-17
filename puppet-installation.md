#Installing on Debian and Ubuntu
For Debian and Ubuntu, the puppet package contains the Puppet agent, and the puppetmaster package contains the
master. On the master, you need to install this:
	
	$ apt-get install puppet puppetmaster
	# On the agent, you only need to install the puppet package:
	$ apt-get install puppet

Installing the puppet, puppetmaster, and facter packages will also install some prerequisite packages, such
as Ruby itself, if they are not already installed.

<h2> For the latest version of Puppet you can use the following Puppetlabs repositories:</h2>
•	 Debian Wheezy:
	$ wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
	$ dpkg -i puppetlabs-release-wheezy.deb
	$ apt-get update
•	 Ubuntu Precise:
	
	$ wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
	$ dpkg -i puppetlabs-release-precise.deb
	$ apt-get update
Replace “precise” with other code names for different versions of Debian and Ubuntu.
