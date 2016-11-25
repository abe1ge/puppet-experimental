class tripwire {
$noninter="DEBIAN_FRONTEND='noninteractive'"

	require smtp
	
	Exec{ path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
	
	exec {'preconfigure':
		command => "cat '/tmp/shared/modules/tripwire/files/set.txt' | debconf-set-selections",
	}
	
	package {'tripwire':
		ensure				=> latest,			
		install_options 	=> [ { 'DEBIAN_FRONTEND' => 'noninteractive' } ],
		require				=> Exec['preconfigure'],
	}
	
	file {'/etc/tripwire/twpol.txt':
		ensure		=> present,
		source		=> 'puppet:///modules/tripwire/twpol.txt',
	#		require		=> File['removefile'],
	}
	
	exec {'config_data':
		command 	=> "echo '' | twadmin -m P /etc/tripwire/twpol.txt",
		require 	=> File['/etc/tripwire/twpol.txt'],
	#	refreshonly	=> true,
	}
	
	exec {'init_data':
		command 	=> 'tripwire --init',
		require 	=> Exec['config_data'],
	#	refreshonly	=> true,
	}
	
	exec {'send_report':
		command		=> "tripwire --check | mail -s 'Tripwire report' timothy.goodwin@qa.com",
		require		=> Exec['init_data'],
	#	refreshonly => true,
	}
	
	cron {'send_report_hourly':
		command	=> "tripwire --check | mail -s 'Tripwire report' timothy.goodwin@qa.com",
		require	=> Exec['send_report'],
		user	=> 'root',
		minute	=> '0',
	}
}		
	
