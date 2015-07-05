# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "ELK-ubuntu"

  if Vagrant.has_plugin?('vachant-cachier')
    config.cache.scope = :box
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "3096"
    vb.name = "ELK-ubuntu"
    vb.cpus = 2
  end

  #config.vm.provision "shell", path: "provisioning/common.sh"
  #config.vm.provision "shell", path: "provisioning/java8.sh"

  config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/*_spec.rb'
  end

end
