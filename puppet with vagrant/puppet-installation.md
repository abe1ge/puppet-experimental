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
