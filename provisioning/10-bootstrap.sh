#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then
  export DEBIAN_FRONTEND="noninteractive" ; set -e -x

  APT="apt-get -y -o DPkg::Options::=--force-confdef -o DPkg::Options::=--force-confold -o APT::Get::force-yes=true"

  #Avoid a few common cases of dependency version drift
  $APT update

  # #Install php 5 (pulls in apache2-mpm-prefork)
  $APT install php5
  # Install Posgre
  $APT install postgresql

  #Install Apache2
  $APT install apache2

  # Install Additional libs
  $APT install php5-gd curl php5-curl php5-mcrypt php5-pgsql php5-cli

  # Let the developer come out of the cave a bit
  $APT install php5-xdebug

  touch $STAMP
fi
