# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  if Vagrant.has_plugin?("vachant-cachier")
    config.cache.scope = :box
    config.cache.auto_detect = false
    config.cache.enable :apt
    config.cache.enable :apt_lists
  end
  config.vm.define 'elk' do |elk|
    elk.vm.hostname = "ELK-ubuntu"
    # nginx port
    elk.vm.network "forwarded_port", guest: 80, host: 8080

    # If you change this IP, you must change in 
    # provisioning/files/openssl/openssl.cnf too
    elk.vm.network "private_network", ip: "172.16.255.10" 

    elk.vm.provider "virtualbox" do |vb|
      vb.memory = "3096"
      vb.name = "ELK-ubuntu"
      vb.cpus = 2
    end

    elk.vm.provision "shell", path: "provisioning/elk/java8.sh"
    elk.vm.provision "shell", path: "provisioning/elk/elasticsearch.sh"
    elk.vm.provision "shell", path: "provisioning/elk/kibana4.sh"
    elk.vm.provision "shell", path: "provisioning/elk/nginx.sh"
    elk.vm.provision "shell", path: "provisioning/elk/logstash.sh"

    elk.vm.provision :serverspec do |spec|
      spec.pattern = 'spec/elk/*_spec.rb'
    end
  end
  
  config.vm.define 'syslog' do |syslog|

    syslog.vm.network "private_network", ip: "172.16.255.20" 
    
    #syslog.vm.provision "shell", path: "provisioning/syslog/deploy.sh"
    
    syslog.vm.provision :serverspec do |spec|
      spec.pattern = 'spec/syslog/*_spec.rb'
    end
  end
end
