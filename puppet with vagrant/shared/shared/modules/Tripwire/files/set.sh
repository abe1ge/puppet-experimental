echo tripwire tripwire/rebuild-policy boolean true | sudo debconf-set-selections
echo tripwire tripwire/rebuild-config boolean true | sudo debconf-set-selections
echo tripwire tripwire/use-sitekey boolean true | sudo debconf-set-selections
echo tripwire tripwire/use-localkey boolean true | sudo debconf-set-selections
echo tripwire tripwire/installed note | sudo debconf-set-selections