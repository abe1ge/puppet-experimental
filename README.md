# puppet-experimental
a repository to use to learn and practice how to use puppet following the pro puppet book

<a href="https://puppet.com/support-services/certification/puppet-professional-practice-exam-2015" target="_blank">Puppet practice exam</a>

<h1> Puppet Resources </h1>


Listing 1-1. A Puppet resource

	package { 'vim':
 		ensure => present,
	}
The resource in Listing 1-1 specifies that a package called vim should be installed. It is constructed as follows:

	type { 'title':
 		attribute => value,
	}

a full list of the Resource Type Reference with their attributes <a href="https://docs.puppet.com/puppet/latest/reference/type.html" >here </a>

