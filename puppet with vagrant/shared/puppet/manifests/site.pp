
node 'agent2.local' {
	package { 'vim:
		ensure => present,
	}
}

node 'agent3.local' {
	package { 'vim':
		ensure => present,
	}
}


