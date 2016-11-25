# == Class: mysql
#
# Full description of class mysql here.
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
#  class { mysql:
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
class mysql {

	Exec {
		path => ["/usr/bin", "/bin", "/usr/sbin","/sbin"],
	}
	
	$dpkg_packages = ["libaio1", "libmecab2"]
	
	package { $dpkg_packages:
		ensure	=> present,
	}
	
	$frontend="DEBIAN_FRONTEND='noninteractive'"

		file { '/opt/mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar': 
		ensure => 'present',
		source => 'puppet:///modules/mysql/mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar',
		notify => Exec['Extract sql'],
	}

	exec { 'Extract sql':
		cwd => '/opt',
		command => 'sudo tar -xvf /opt/mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar',
		#logoutput => true,
		refreshonly => true,
		notify => Exec['sqlprecon'],
	}

	exec { 'sqlprecon':
		command => "sudo ${frontend} dpkg-preconfigure mysql-community-server_5.7.15-1ubuntu14.04_amd64.deb",
		#logoutput => true,
		cwd => '/opt',
		refreshonly => true,
		notify => Exec['sqlclients'],
	}

	exec { 'sqlclients':
		command => 'sudo dpkg -i mysql-common_5.7.15-1ubuntu14.04_amd64.deb',
		cwd => '/opt',
		provider => shell,
		#logoutput => true,
		refreshonly => true,
		notify => Exec['sqlclients2'],
		require => Package[$dpkg_packages],
	}

	exec { 'sqlclients2':
		command => 'sudo dpkg -i mysql-community-client_5.7.15-1ubuntu14.04_amd64.deb',
		cwd => '/opt',
		provider => shell,
		#logoutput => true,
		refreshonly => true,
		notify => Exec['sqlclients3'],
		require => Package[$dpkg_packages],
	}

	exec { 'sqlclients3':
		command => 'sudo dpkg -i mysql-client_5.7.15-1ubuntu14.04_amd64.deb',
		cwd => '/opt',
		provider => shell,
		#logoutput => true,
		refreshonly => true,
		notify => Exec['sqlservers'],
	}


	exec { 'sqlservers':
		command => 'sudo dpkg -i mysql-community-server_5.7.15-1ubuntu14.04_amd64.deb',
		cwd => '/opt',
		#logoutput => true,
		refreshonly => true,
		provider => shell,
		notify => Exec['sqlservers2'],
	}

	exec { 'sqlservers2':
		command => 'sudo dpkg -i mysql-server_5.7.15-1ubuntu14.04_amd64.deb',
		cwd => '/opt',
		#logoutput => true,
		provider => shell,
		refreshonly => true,
	}

}
