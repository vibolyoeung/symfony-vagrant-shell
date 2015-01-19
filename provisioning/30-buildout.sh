#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then
  set -e

  pushd /vagrant > /dev/null
  if [ ! -f /vagrant/composer.phar ]; then
    curl -sS https://getcomposer.org/installer | php
  fi

  if [ ! -f /vagrant/composer.json ]; then
  	/vagrant/composer.phar init
  fi
  /vagrant/composer.phar --no-interaction install --no-progress

  # Installing symfony
  if [ ! -f /usr/local/bin/symfony ]; then
		curl -LsS http://symfony.com/installer > symfony.phar
		sudo mv symfony.phar /usr/local/bin/symfony
		sudo chmod a+x /usr/local/bin/symfony
		sudo symfony new ${APPNAME}
  fi

  chmod a+x /vagrant/${APPNAME}

  popd > /dev/null
  touch $STAMP
fi
