#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then
  export DEBIAN_FRONTEND="noninteractive" ; set -e #-x

  cat > /etc/apache2/sites-available/${APPNAME}.conf << _EOF
   <VirtualHost *:80>
    ServerName 127.0.0.1:8000

    DocumentRoot /vagrant/${APPNAME}/web
    <Directory /vagrant/${APPNAME}/web>
        # enable the .htaccess rewrites
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog /var/log/apache2/${APPNAME}_error.log
    CustomLog /var/log/apache2/${APPNAME}_access.log combined
</VirtualHost>
_EOF

  service apache2 stop
  a2enmod rewrite
  a2ensite ${APPNAME}.conf
  service apache2 start

  touch $STAMP
fi
