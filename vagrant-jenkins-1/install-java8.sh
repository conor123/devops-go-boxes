# Java 8 Installer
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
echo | add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer -y
apt-get install oracle-java8-set-default -y

nstaller