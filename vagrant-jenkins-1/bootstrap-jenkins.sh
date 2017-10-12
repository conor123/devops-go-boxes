#Jenkins Requires Java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
echo | add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer -y
apt-get install oracle-java8-set-default -y




#Jenkins Installation

if ! grep -q "deb http://pkg.jenkins-ci.org/debian binary/" "/etc/apt/sources.list";
then
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
  echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list
  echo "Added apt source!"
else
  echo "Did not add apt source!"
fi

apt-get update
apt-get install jenkins -y
service jenkins start
