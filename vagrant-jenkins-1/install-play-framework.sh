#!/usr/bin/env bash
# Play framework
wget https://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6-minimal.zip
apt-get install unzip -y
unzip typesafe-activator-1.3.6-minimal.zip
mv activator-1.3.6-minimal/ bin
. .profile # reload startup scripts
rm typesafe-activator-1.3.6-minimal.zip
