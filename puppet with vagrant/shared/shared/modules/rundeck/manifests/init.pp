class rundeck{

  require jenkins

  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  
  file{'/opt/rundeck-2.6.11-1-GA.deb':
    ensure    => 'file',
    source    => 'puppet:///modules/rundeck/rundeck-2.6.11-1-GA.deb',
    notify    => Exec['unpackrundeck'], 
  }
 
  exec{'unpackrundeck':
    cwd         => '/opt/',
    command     => 'sudo dpkg -i rundeck-2.6.11-1-GA.deb || :',
    refreshonly => 'true',
    notify      => Exec['forcedependencies'],
	require     => File['/opt/rundeck-2.6.11-1-GA.deb'],
    }
 
  exec{'forcedependencies':
    cwd           => '/opt/',
    command       => 'sudo apt-get install -y -f',
    refreshonly   => 'true',
	timeout       => '600',
    notify        => File['/etc/rundeck/rundeck-config.properties'],
  }

  file{'/etc/rundeck/rundeck-config.properties':
    ensure => present,
    notify => Exec['editconfig'],
  }

 exec{'editconfig':
    command => 'sed -i -e "s/grails.serverURL=http:\/\/localhost:4440/# grails.serverURL=http:\/\/localhost:4440/g" /etc/rundeck/rundeck-config.properties',
    notify  => Service['rundeckd'],
  }

  service{'rundeckd':
    ensure      => 'running',
    enable      => 'true',
    subscribe   => Exec['editconfig'],
  } 
  
  exec{'resetjava':
    require => Service['rundeckd'],
    command => 'echo "1" | sudo update-alternatives --config java'
  }
}
