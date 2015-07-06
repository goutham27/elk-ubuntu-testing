# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "ELK-ubuntu"

  if Vagrant.has_plugin?('vachant-cachier')
    config.cache.scope = :box
  end

  # elasticsearch ports
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 9300, host: 9300

  # nginx port
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "3096"
    vb.name = "ELK-ubuntu"
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "provisioning/java8.sh"
  config.vm.provision "shell", path: "provisioning/elasticsearch.sh"
  config.vm.provision "shell", path: "provisioning/kibana4.sh"
  config.vm.provision "shell", path: "provisioning/nginx.sh"

  config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/*_spec.rb'
  end

end
