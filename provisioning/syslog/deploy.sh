#! /bin/sh

sudo mkdir -p /etc/pki/tls/certs
sudo cp -a /vagrant/provisioning/common/files/openssl/logstash-forwarder.crt /etc/pki/tls/certs

echo 'deb http://packages.elasticsearch.org/logstashforwarder/debian stable main' \
  | sudo tee /etc/apt/sources.list.d/logstashforwarder.list

wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch \
  | sudo apt-key add -

sudo apt-get update
sudo apt-get install logstash-forwarder

cp -a provisioning/syslog/files/logstash-forwarder.conf /etc/

sudo service logstash-forwarder start
