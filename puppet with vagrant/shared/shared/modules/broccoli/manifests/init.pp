class broccoli {
	require nodejs
	Exec {
		path => ['/usr/bin', '/bin', '/home/vagrant/node-v6.9.1-linux-x64/bin'],
	}
	exec {"install packages":
		command => 'sudo apt-get update -y',
		before => Exec['install broccoli CLI'],
	}
	exec {"install broccoli CLI":
		command => 'npm install -g broccoli-cli',
		before => Exec['make folder']
	}
	exec {"make folder":
		command => 'mkdir /opt/broccoli',
		before => Exec['install broccoli'],
	}
	exec {"install broccoli":
		cwd => "/opt/broccoli",
		command => 'npm install --save-dev broccoli',
	}
}
