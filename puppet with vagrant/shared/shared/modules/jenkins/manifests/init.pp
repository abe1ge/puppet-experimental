class jenkins {
	require java
	
	#exec { 'install_jenkins_package_keys':
	#	command => '/usr/bin/wget -q -O http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | /usr/bin/apt-key',
	#}
	
	#file { "/etc/apt/sources.list.d/jenkins.list":
	#	mode   => 644,
	#	owner  => root,
	#	group  => root,
	#	source => "puppet:///modules/jenkins/jenkins_2.1_all.deb",
	#}
	
	#package { 'jenkins':
	#	ensure  => present,
	#	require => [ Exec['install_jenkins_package_keys'],
	#				 File['/etc/apt/sources.list.d/jenkins.list'], ],
	#}
	
	#service {'jenkins':
	#	ensure => running,
	#}
	
	#exec { 'be_root' :
	#	command => 'sudo -i',
	#}
	
	Exec {
		path => ['/bin', '/usr/bin'],
	}
	
	file { '/opt/jenkins_2.1_all.deb':
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		source  => 'puppet:///modules/jenkins/jenkins_2.1_all.deb',
		before  => Exec['install_jenkins'],
	}
	
	file { '/opt/jenkins.sh':
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		source  => 'puppet:///modules/jenkins/jenkins.sh',
		before  => Exec['install_jenkins'],
	}
	
	exec { 'install_jenkins':
		timeout  => 900,
		provider => shell,
		command  => '/opt/jenkins.sh',
		onlyif   => '! sudo service jenkins status',
		#require  => [File['/opt/jenkins.sh'], File['/opt/jenkins_2.1_all.deb']],
	}
	
	
	#exec {'install_jenkins_key':
	#	user    => root,
	#	command => 'sudo -i && sudo wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -',
	#	#require => Exec['be_root'],
	#}
	
	#exec { 'apt-get update':
	#	command => 'apt-get update',
	#	require => File['/etc/apt/sources.list.d/jenkins.list'],
	#}
	
	#file { '/etc/apt/sources.list.d/jenkins.list':
	#	content  => "sudo dpkg -i puppet:///modules/jenkins/jenkins_2.1_all.deb",
	#	mode     => '0644',
	#	owner    => root,
	#	group    => root,
	#	require  => Exec['install_jenkins_key'],
	#}
	
	#package { 'jenkins':
	#	ensure  => latests,
	#	require => Exec['apt-get update'],
	#}
	
	#service { 'jenkins':
	#	ensure => running,
	#	require => Package['jenkins'],
	#}
	
}