# puppet-experimental
a repository to use to learn and practice how to use puppet following the pro puppet book

<a href="https://puppet.com/support-services/certification/puppet-professional-practice-exam-2015" target="_blank">Puppet practice exam</a>

<h1> Puppet Basics </h1>

<h2> a Resource </h2>
Listing 1-1. A Puppet resource

	package { 'vim':
 		ensure => present,
	}
The resource in Listing 1-1 specifies that a package called vim should be installed. It is constructed as follows:

	type { 'title':
 		attribute => value,
	}

a full list of the Resource Type Reference with their attributes <a href="https://docs.puppet.com/puppet/latest/reference/type.html" >here </a>

<h2> The Resource Abstraction Layer </h2>
<h4> the resource abstraction layer </h4>
When puppet is given a task such as the one above to install vim. we don't have to worry about the how it is going to do it on different platform because puppet uses a tool called <b>facter</b> to find out about the system and use the correct terminology or run the correct processes. 

for example to install vim on ubuntu you will use apt-get and centos you use yum. in pupet you don't have to worry about this you just have to specify that the package must be present as showen in listing 1-1.


<h4>The Transactional Layer</h4>
Puppet’s transactional layer is its engine. 
The first step Puppet takes is to analyze your configuration and calculate how to apply it to your agent. To do this,
Puppet creates a graph showing all resources, with their relationships to each other and to each agent. like below

<p align="center">
  <img src="https://blog.openshift.com/wp-content/uploads/imported/blog-puppet-deps-03.png" width="350" hight="400"/>
</p>



