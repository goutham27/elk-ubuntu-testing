#!/bin/sh

if which java >/dev/null; then
    echo "skip java 8 installation"
else
  echo "java 8 installation"
  sudo apt-get update
  sudo apt-get dist-upgrade -y
  sudo apt-get install --yes python-software-properties
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update -qq
  echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
  sudo apt-get install --yes oracle-java8-installer
  yes "" | sudo apt-get -f install
fi
