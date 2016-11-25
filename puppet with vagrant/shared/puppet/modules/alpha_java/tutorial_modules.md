#basics about modules

The next step in our node configuration is to create a sudo module. Again, a module is a collection of manifests,
resources, files, templates, classes, and definitions. A single module would contain everything required to configure a
particular application. For example, it could contain all the resources (specified in manifest files), files, and associated
configuration to configure Apache or the sudo command on a host. We will create a sudo module and a sudo class.
Each module needs a specific directory structure and a file called init.pp. This structure allows Puppet to
automatically load modules. To perform this automatic loading, Puppet checks a series of directories called the
module path. This path is configured with the modulepath configuration option in the [master] section of the
puppet.conf file. By default, Puppet looks for modules in the /etc/puppet/modules and /usr/share/puppet/
modules directories, but you can add additional locations if required:

  	[master]
	modulepath = /etc/puppet/modules:/var/lib/puppet/modules:/opt/modules
  
the most basics about modules can be found this website https://docs.puppet.com/puppet/latest/reference/modules_fundamentals.html

we would create our first module using the module generate command.

 	# you use the generate command like so in the /etc/puppet/modules/ directory
  	puppet module generate <you or company name>-<module name>
  	$ cd /etc/puppet/modules/
  	$ puppet module generate alpha-sudo
  	Notice: Generating module at /etc/puppet/modules/alpha-sudo
  	alpha-sudo
  	alpha-sudo/Modulefile
  	alpha-sudo/README
  	alpha-sudo/manifests
  	alpha-sudo/manifests/init.pp
  	alpha-sudo/spec
  	alpha-sudo/spec/spec_helper.rb
  	alpha-sudo/tests
  	alpha-sudo/tests/init.pp
	
<h2> auto creating a module </h2>

Unfortantly for some reason when running this module it doesn't run it probely and i think its because of due to the name, to fix this you can just change the name to remove your name and the dash like so

	$ sudo mv -r alpha-sudo sudo 
	# you can test puppet is able to run the module by doning the following
	
	$ sudo puppet apply sudo/manifests/site.pp
	
