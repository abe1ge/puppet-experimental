class kibana {

  require elasticsearch

  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  
  file {'/opt/kibana-5.0.1-amd64.deb':
    ensure  => 'file',
    source  => 'puppet:///modules/kibana/kibana-5.0.1-amd64.deb',
  }

  package {'kibana':
    provider  => dpkg,
    ensure    => latest,
    source    => '/opt/kibana-5.0.1-amd64.deb',
    require   => File['/opt/kibana-5.0.1-amd64.deb'],
  }
  
  service {'kibana': 
    ensure   => running,
    require  => Package['kibana'],
  }
  
  file {'/usr/local/bin/kibana-config.sh':
    ensure   => 'file',
    source   => 'puppet:///modules/kibana/kibana-config.sh',
    require  => Service['kibana'],
    notify   => Exec['config-kibana'],
  }
  
  exec {'config-kibana':
    command      => '/usr/local/bin/kibana-config.sh',
    refreshonly  => true,
  }
}
