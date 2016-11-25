Broccoli installation guide

Broccoli is fairly simple to install.
First the node and npm packages need installing so that Broccoli can be installed via npm.
Use the npm installer to install the Broccoli CLI, the -g tag means global.
Then use npm to install Broccoli in a project directory.
A sample directory was created to install Broccoli into.

Using Broccoli after installation

In the project directory, use the command touch 'Brocfile.js'.
This file tells Broccoli how to build the project.
Various plugins may be installed to compile different types of code.
An example plugin is 'broccoli-coffee'.
These plugins are installed via npm.
The final step is to build the project.
This is done with 'broccoli build dist'.
