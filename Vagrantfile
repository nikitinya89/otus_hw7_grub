# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos7"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision "shell", name:"rename_vg", path:"rename.sh", run:"once"
  config.vm.provision :reload
  config.vm.provision "shell", name:"rename_vg2", path:"rename2.sh", run:"once"
  config.vm.provision "shell", name:"module", path:"module.sh", run:"once"
  config.vm.provision :reload
end


