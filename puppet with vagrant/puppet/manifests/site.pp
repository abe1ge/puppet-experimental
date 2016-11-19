node 'agent2@local' {
  package { 'vim':
    ensure => present,
  }
}