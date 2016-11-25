#this will be needed to be configured for use with jenkins
class gatling{

    #require java
    require jenkins

    Exec {
                path => [ "/usr/bin", "/bin", "/usr/sbin"],
        }

    #package {'unzip':
    #   ensure => present,
    #}
    
    file{'/var/lib/jenkins/plugins':
        ensure => 'directory',
    }
    
    #file {'/opt/gatling/gatling-charts-highcharts-bundle-2.2.3-bundle.zip':
    #    ensure => 'file',
    #   source => '/tmp/shared/modules/gatling/package/gatling-charts-highcharts-bundle-2.2.3-bundle.zip',
    #    subscribe => File ['/opt/gatling'],
    #}
    
    #exec {'unzipgatling':
    #    cwd => '/opt/gatling',
    #    command => 'sudo unzip gatling-charts-highcharts-bundle-2.2.3-bundle.zip',
    #    refreshonly => 'true',
    #    subscribe  => File['/opt/gatling/gatling-charts-highcharts-bundle-2.2.3-bundle.zip']
    #}
	exec {'movePlugins':
		cwd  => '/tmp/shared/modules/gatling/files',
		command => 'sudo cp -r plugins/* /var/lib/jenkins/plugins/',
	}
	exec {'changePermisions':
		command => 'chown -R jenkins:jenkins /var/lib/jenkins/',
		require => Exec['movePlugins'],
	}
	exec{'rebuildjenkins':
		command => 'service jenkins restart',
		require => Exec['changePermisions'],
	}
}
