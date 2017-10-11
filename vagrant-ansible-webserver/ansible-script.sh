#Create share Folder
if [ ! -d share ]; then
    mkdir share
fi

# Install Ansible
apt-get install ansible -y

# Generate RSA Public & Private key
if [ ! -f .ssh/id_rsa ]; then
    echo | ssh-keygen -P ''
    chmod 600 .ssh/id_rsa
    chmod 600 .ssh/id_rsa.pub
    ssh-agent bash
    ssh-add .ssh/id_rsa.pub
    cp .ssh/id_rsa.pub share/id_rsa.pub

fi

# Hosts Inventory
if [ ! -f hosts ]; then
    echo "[webservers]" > hosts
    echo "192.168.0.2" >> hosts
fi

#
#
#
echo "End of Installation Script!"
