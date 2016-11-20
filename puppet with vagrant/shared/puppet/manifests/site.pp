
node 'agent3.local' {
	package { 'vim':
		ensure => present,
	}
}

node 'master.local' {
	package { 'vim':
		ensure => present,
	}
}