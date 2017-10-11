#Create share Folder
if [ ! -d share ]; then
    mkdir share
fi
#
cat share/id_rsa >> /root/.ssh/authorized_keys
