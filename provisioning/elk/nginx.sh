#! /bin/sh

# Based on https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-4-on-ubuntu-14-04

KIBANA_ADMIN="kibanaadmin"
KIBANA_PASSWD="password"

dpkg-query -l nginx > /dev/null
if [ $? -eq 0 ]; then
  echo "skip nginx installation"
else
  echo "nginx installation"
  sudo apt-get -y install nginx apache2-utils
  sudo htpasswd -cb /etc/nginx/htpasswd.users "$KIBANA_ADMIN" "$KIBANA_PASSWD"
  sudo cp -a /vagrant/provisioning/elk/files/nginx/default /etc/nginx/sites-available/default
  sudo service nginx restart
fi
