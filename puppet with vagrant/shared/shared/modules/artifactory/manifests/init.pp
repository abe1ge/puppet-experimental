class artifactory {
	
	require rundeck
	
	
	Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
	
	file  { '/opt/jfrog':
		ensure	=> 'directory',
	}
	
	file { '/opt/jfrog/artifactory':
		ensure		=> 'directory',
		require		=> File['/opt/jfrog']
	}
	
	file { '/opt/jfrog/artifactory/jfrog-artifactory-oss-4.14.1.zip':
		ensure		=> 'file',
		source		=> '/tmp/shared/modules/artifactory/files/jfrog-artifactory-oss-4.14.1.zip',
		require		=> File['/opt/jfrog/artifactory'],
	}
	
	exec { 'unzipartifactory':
		cwd			=> '/opt/jfrog/artifactory',
		command		=> 'unzip jfrog-artifactory-oss-4.14.1.zip',
		#return		=> [0,9],
		require		=> File['/opt/jfrog/artifactory/jfrog-artifactory-oss-4.14.1.zip']
	}
		
	exec { 'installartifactory':
		command		=> '/opt/jfrog/artifactory/artifactory-oss-4.14.1/bin/installService.sh',
		require		=> Exec['unzipartifactory'],	
	}
	
	service { 'artifactory':
	  ensure        => 'running',
	  enable        => 'true',
	  subscribe     => Exec['installartifactory'],
	}

}