packer build template.json
vagrant box add centos67 centos-6-7-x64-virtualbox.box
(echo GPBIN=$1 | cat - provision.sh > temp.sh)  &&  mv temp.sh provision.sh
chmod 777 ./gpinstall.sh
vagrant up
