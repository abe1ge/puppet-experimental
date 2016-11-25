class elasticsearch {

  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  file {'/opt/elasticsearch-5.0.1.deb':
    ensure  => 'file',
    source  => 'puppet:///modules/elasticsearch/elasticsearch-5.0.1.deb',
  }

  package {'elasticsearch':
    provider  => dpkg,
    ensure    => latest,
    source    => '/opt/elasticsearch-5.0.1.deb',
    require   => File['/opt/elasticsearch-5.0.1.deb'],
  }
  
  service {'elasticsearch': 
    ensure   => running,
    require  => Package['elasticsearch'],
  }
}
