#! /bin/sh

# Based on https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-4-on-ubuntu-14-04

dpkg-query -l elasticsearch > /dev/null
if [ $? -eq 0 ]; then
  echo "skip elasticsearch installation"
else
  echo "elasticsearch installation"
  wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
  echo 'deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list
  sudo apt-get update
  sudo apt-get -y install elasticsearch
  echo "ES_JAVA_OPTS=-Djava.net.preferIPv4Stack=true" | sudo tee -a /etc/default/elasticsearch
  sudo service elasticsearch restart
  sudo update-rc.d elasticsearch defaults 95 10
fi
