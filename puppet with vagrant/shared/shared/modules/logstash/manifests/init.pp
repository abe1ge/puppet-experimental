class logstash {

  require java
  require elasticsearch
  
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  
  file {'/opt/logstash-5.0.1.deb':
    ensure  => 'file',
    source  => 'puppet:///modules/logstash/logstash-5.0.1.deb',
  }

  package {'logstash':
    provider  => dpkg,
    ensure    => latest,
    source    => '/opt/logstash-5.0.1.deb',
    require   => File['/opt/logstash-5.0.1.deb'],
  }
  
  service {'logstash': 
    ensure   => running,
	require  => Package['logstash'],
  }
  
  file {'/usr/local/bin/logstash-config.sh':
    ensure   => 'file',
    source   => 'puppet:///modules/logstash/logstash-config.sh',
    require  => Service['logstash'],
  }
  
  file {'/usr/share/logstash/logstash-simple.conf':
    ensure   => 'file',
    source   => 'puppet:///modules/logstash/logstash-simple.conf',
    require  => File['/usr/local/bin/logstash-config.sh'],
	notify   => Exec['config-logstash'],
  }
  
  exec {'config-logstash':
    command      => '/usr/local/bin/logstash-config.sh',
    refreshonly  => true,
  }
}
