# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

   config.vm.provision :shell, :inline => <<-END
    export ROOT_DBUSER_PASSWORD="root"
    export DBUSER="vagrant"
    export DBUSER_PASSWORD="vagrant"
    export DBNAME="vagrant_db"
    export APPNAME="symfony"
    set -e
    for s in /vagrant/provisioning/??-*.sh ; do $s ; done
  END
  config.vm.network :forwarded_port, host: 8000, guest: 80 #Apache server
  config.vm.hostname = "symfony.local"
  config.vm.box_check_update = false
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=764"]
end
