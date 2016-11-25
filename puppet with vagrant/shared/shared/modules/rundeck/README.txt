This module installs Rundeck, which acts as a scheduling tool.

It can be accessed on the agent by navigating a browser to http://localhost:4440,
with username "admin" and password "admin".

Install process could possibly be shortened by ensuring dependencies are loaded
(Namely java-headless).

Requirements:
rundeck-2.6.11-1-GA.deb

Module process:

1) Move rundeck .deb file from shared folder to /opt
2) Check for dependencies before unpacking the .deb file.
3) Edit the config file to comment out the grails server URL
4) Ensure the service is running.
 