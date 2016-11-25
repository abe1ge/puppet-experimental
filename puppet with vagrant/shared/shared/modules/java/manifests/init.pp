class java{

  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  file{'/opt/java':
    ensure  => 'directory',
  }
  
  file{'/opt/java/java.tar.gz':
    ensure     => 'file',
    source     => 'puppet:///modules/java/java.tar.gz',
    subscribe  =>File['/opt/java'],
  }
  
  exec{'untarjava':
    cwd          => '/opt/java',
    command      => 'tar zxvf java.tar.gz',
    refreshonly  => 'true',
    subscribe    => File['/opt/java/java.tar.gz'],
  }
  
  exec{'updatejava':
    command      => 'update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_45/bin/java 100',
    refreshonly  => 'true',
    subscribe    => Exec['untarjava'], 
  }
  
    exec{'updatejavac':
    command      => 'update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.8.0_45/bin/javac 100',
    refreshonly  => 'true',
    subscribe    => Exec['untarjava'], 
  }
}
