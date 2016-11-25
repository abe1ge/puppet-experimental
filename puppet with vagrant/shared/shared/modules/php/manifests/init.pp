# == Class: php
#
# Full description of class php here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { php:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class php {

	#require aptupdate
	

	Exec {
		path => ["/usr/sbin","/usr/bin","/bin"],
	}

	$php_packages = ["php5","libapache2-mod-php5","php5-mcrypt"]

	package { $php_packages:
		ensure	=> present,
	}
	
	#change search order
	exec { 'searchor':
		command	=> "sudo  sed -i -e 's/index.html index.cgi index.pl index.php index.xhtml index.htm/index.php index.html index.cgi index.pl index.xhtml index.htm/g' /etc/apache2/mods-enabled/dir.conf",
		require	=> Package[$php_packages],
	}
}
