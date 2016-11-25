class mocha {

	require nodejs
	
	Exec {
                path => [ "/usr/bin", "/bin", "/usr/sbin", "/home/vagrant/node-v6.9.1-linux-x64"],
        }

        exec { 'mocha':
        cwd     => '/opt',
        command => 'npm install --global mocha',
        }

}
