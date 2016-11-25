class terraform {
    
    Exec {
        path => ['/bin', 'usr/bin', 'usr/sbin'],
    }
    package {'unzip':
       ensure => present,
    }
    
    file{'/opt/terraform':
        ensure => 'directory',
    }

    file {'/opt/terraform/terraform':
        ensure => 'file',
        source => '/tmp/shared/modules/terraform/files/terraform_0.7.13_linux_a$
        require => File['/opt/terraform'],
        notify  => Exec['installTerraform'],

    }
    exec{'installTerraform':
        cwd     => '/opt/terraform',
        command => 'cp terraform /usr/bin',
        require => File['/opt/terraform/terraform'],
    }

}

}