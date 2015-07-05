#! /bin/bash

# Based on https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-4-on-ubuntu-14-04

if $(dpkg -l | grep elasticsearch | grep ^ii) > /dev/null; then
  echo "skip elasticsearch instalation"
else
  echo "install elasticsearch"
  wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
  echo 'deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list
  sudo apt-get update
  sudo apt-get -y install elasticsearch=1.4.4
fi
