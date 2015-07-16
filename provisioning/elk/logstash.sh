#! /bin/sh

# Based on https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-4-on-ubuntu-14-04

test -f '/etc/apt/sources.list.d/logstash.list' 
if [ $? -eq 0 ]; then
  echo "skip logstash installation"
else
  echo "logstash installation"
  echo 'deb http://packages.elasticsearch.org/logstash/1.5/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash.list
  sudo apt-get update
  sudo apt-get install logstash
  sudo mkdir -p /etc/pki/tls/certs
  sudo mkdir /etc/pki/tls/private
  cd /etc/pki/tls
  sudo cp -a /vagrant/provisioning/elk/files/openssl/openssl.cnf /etc/ssl/
  sudo openssl req -config /etc/ssl/openssl.cnf \
    -x509 -days 3650 -batch -nodes -newkey rsa:2048 \
    -keyout private/logstash-forwarder.key \
    -out certs/logstash-forwarder.crt
  sudo cp -a /vagrant/provisioning/elk/files/logstash/conf.d/01-lumberjack-input.conf  \
    /etc/logstash/conf.d/
  sudo cp -a /vagrant/provisioning/elk/files/logstash/conf.d/10-syslog.conf \
    /etc/logstash/conf.d/
  sudo cp -a /vagrant/provisioning/elk/files/logstash/conf.d/30-lumberjack-output.conf \
    /etc/logstash/conf.d/
  echo "LS_JAVA_OPTS=-Djava.net.preferIPv4Stack=true" | sudo tee -a /etc/default/logstash
  sudo service logstash restart
  sudo cp -a /etc/pki/tls/certs/logstash-forwarder.crt /vagrant/provisioning/common/files/openssl
  sleep 20 # Wait until logstash is up, is necesary for passing rspec tests
fi
