#Jenkins Installation - Requires Java 8

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
