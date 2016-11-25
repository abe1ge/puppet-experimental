#!/bin/bash

sudo apt-get install -y apache2 apache2-utils libapache2-mod-php5 build-essential libgd-dev

sudo -s
useradd -m -s /bin/bash nagios
echo "nagios" | passwd nagios -S
groupadd nagios
usermod -G nagios nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd www-data


#INSTALL NAGIOS-CORE
cd /opt/
tar xzvf /tmp/shared/modules/nagios/files/nagios-4.2.3.tar.gz
cd nagios-*

./configure --with-command-group=nagcmd

make all
make install
make install-init
make install-config
make install-commandmode

make install-webconf

echo "nagios" | htpasswd -c -i /usr/local/nagios/etc/htpasswd.users nagiosadmin

/etc/init.d/apache2 reload

#INSTALL NAGIOS-PLUGINS
cd /opt/
tar xzvf /tmp/shared/modules/nagios/files/nagios-plugins-2.1.4.tar.gz
cd nagios-plugins-*

./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install

ln -s /etc/init.d/nagios /etc/rcS.d/S99nagios
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

/etc/init.d/nagios start