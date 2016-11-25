class nagios {
	require apache
	#require php
	#require mysql

	Exec {
        path => [ "/usr/bin", "/bin", "/usr/sbin"],
    }
	
	file { '/opt/nagios-4.2.3.tar.gz':
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		source  => 'puppet:///modules/nagios/nagios-4.2.3.tar.gz',
		before  => Exec['install_nagios'],
	}
	
	file { '/opt/nagios.sh':
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		source  => 'puppet:///modules/nagios/nagios.sh',
		before  => Exec['install_nagios'],
	}
	
	exec { 'install_nagios':
		timeout  => 900,
		provider => shell,
		command  => '/opt/nagios.sh',
		#require  => [File['/opt/nagios.sh'], File['/opt/nagios-4.2.3.tar.gz']],
	}
	
}