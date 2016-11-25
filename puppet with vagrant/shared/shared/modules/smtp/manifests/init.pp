class smtp {

	require apt
	
	Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
	
	exec {'mailname':
		command		=> "debconf-set-selections <<< 'postfix postfix/mailname string test' && \n
						debconf-set-selections <<< \"postfix postfix/main_mailer_type string 'Internet Site'\"",
		refreshonly => true,
	}
	
	package {'mailutils':
		ensure	=> 'latest',
		require => Exec['mailname'],
	}
	
	exec {'edit_file':
		command => "sed -i '39s/all/localhost/g' /etc/postfix/main.cf",
		require => Package['mailutils'],
		notify	=> Service['postfix'],
	}
	
	service { 'postfix':
		ensure	=> 'running',
		enable	=> 'true',
		require => Package['mailutils'],
	}
	
}	
