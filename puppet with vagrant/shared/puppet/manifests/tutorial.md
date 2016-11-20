#node definition  

the node definitions is added in /manifests/site.pp
this is where you specifiy what packages a node should have and what it shouldn't have. the following exmaple shows how ou define how a node should have vim installed.

	node 'agent2.local' {
		package { 'vim':
			ensure => present,
		}
	}
