#! /bin/sh

# Based on https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-4-on-ubuntu-14-04

test -d '/opt/kibana' > /dev/null
if [ $? -eq 0 ]; then
  echo "skip kibana4 installation"
else
  echo "kibana4 installation"
  cd ~; wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz
  tar xvf kibana-*.tar.gz
  sudo mkdir -p /opt/kibana
  sudo cp -R ~/kibana-4*/* /opt/kibana/
  cd /etc/init.d && sudo wget https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/bce61d85643c2dcdfbc2728c55a41dab444dca20/kibana4
  sudo chmod +x /etc/init.d/kibana4
  sudo update-rc.d kibana4 defaults 96 9
  sudo service kibana4 start
fi
