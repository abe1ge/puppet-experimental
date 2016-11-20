#node definition  

the node definitions is added in /manifests/site.pp
this is where you specifiy what packages a node should have and what it shouldn't have. the following exmaple shows how ou define how a node should have vim installed.

	node 'agent2.local' {
		package { 'vim':
			ensure => present,
		}
	}

By defualt a puppet agent checks for update every 30 minutes. to not have to wait for this we can run the following line to force the agent to check for updates.

	$ puppet agent --test
	Info: Retrieving plugin
	Info: Caching catalog for agent2.local
	Info: Applying configuration version '1479647259'
	Notice: Finished catalog run in 0.08 seconds
	
to learn more about node definition go to https://docs.puppet.com/puppet/latest/reference/lang_node_definitions.html#inheritance

if you want to group a few nodes or just apply a certin things to certin nodes you can seperate them by a comma instead of creating a node definision for all of them

	node 'agent2.local', 'agent3.local'{
		package { 'vim':
			ensure => present,
		}
	}

another way of writing the above is

	node /^(agent2|agent3)\.local$/ {
       		package { 'vim':
                	ensure => present,
        	}
	}
	
	#this will match agent2.local and agent3.local 




