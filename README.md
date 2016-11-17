# puppet-experimental
a repository to use to learn and practice how to use puppet following the pro puppet book

<link rel="hello" type="text/css" href="https://docs.puppet.com/puppet/latest/reference/type.html">

<h1> Puppet Resources </h1>


Listing 1-1. A Puppet resource

	package { 'vim':
 		ensure => present,
	}
The resource in Listing 1-1 specifies that a package called vim should be installed. It is constructed as follows:

	type { 'title':
 		attribute => value,
	}

a full list of the types with their attributes <herf here
