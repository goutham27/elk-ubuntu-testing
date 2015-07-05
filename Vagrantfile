# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|


  config.vm.box = "ubuntu/trusty64"

  if Vagrant.has_plugin?('vachant-cachier')
    config.cache.scope = :box
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "3096"
    vb.name = "ELK-ubuntu"
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "provsioning/elk.sh"


end
