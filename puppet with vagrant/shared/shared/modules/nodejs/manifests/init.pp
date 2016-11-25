# == Class: nodejs
#
# Full description of class nodejs here.
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
#  class { nodejs:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 tim and the funky bunch, unless otherwise noted.
#
class nodejs {


	case $operatingsystem {
		ubuntu: {

			Exec {
		                path => ["/usr/sbin","/usr/bin","/bin"],
			}

			exec { 'update_pkg':
				command => "sudo apt-get update",
			}
		
			$needed_packages = ["nodejs", "npm"]

			package { $needed_packages:
		                ensure  => present,
				require	=> Exec['update_pkg'],
		        }
			
			exec { 'creationix':
				command	=> 'ln -s /usr/bin/nodejs /usr/bin/node',
				require	=> Package[$needed_packages],
			}			
		}
	}
}
