class apt ($always_update = true ) {
	
	Exec {	path => ['/sbin','/bin','/usr/bin','/usr/sbin'],
	}

	exec { 'apt-get -y update': }
}
