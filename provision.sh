# firewall close
service iptables stop
sudo yum -y install expect

# User Config
groupadd -g 530 gpadmin
useradd -g 530 -u 530 -m -d /home/gpadmin -s /bin/bash gpadmin
chown -R gpadmin:gpadmin /home/gpadmin/
echo "gpadmin"|passwd --stdin gpadmin

mkdir -p /home/gpadmin/conf
# Hostname Config
echo "192.168.1.100 mdw"  >> /etc/hosts
echo "192.168.1.101 sdw1" >> /etc/hosts
echo "192.168.1.102 sdw2" >> /etc/hosts
echo "192.168.1.103 sdw3" >> /etc/hosts

# SSH Config
echo "mdw"  >> /home/gpadmin/conf/hostlist
echo "sdw1" >> /home/gpadmin/conf/hostlist
echo "sdw2" >> /home/gpadmin/conf/hostlist
echo "sdw3" >> /home/gpadmin/conf/hostlist

echo "sdw1" >> /home/gpadmin/conf/seg_hosts
echo "sdw2" >> /home/gpadmin/conf/seg_hosts
echo "sdw3" >> /home/gpadmin/conf/seg_hosts

# GreenPlum Config
mkdir /opt/greenplum
chown -R gpadmin:gpadmin /opt/greenplum
chown -R gpadmin:gpadmin /opt

/vagrant/gp.sh greenplum-db-4.3.6.2-build-1-RHEL5-x86_64.bin

echo "source /opt/greenplum/greenplum_path.sh" >> /home/gpadmin/.bash_profile
echo "source /opt/greenplum/greenplum_path.sh" >> /etc/profile
echo "export MASTER_DATA_DIRECTORY=/home/gpadmin/gpdata/gpmaster/gpseg-1" >> /etc/profile
echo "export MASTER_DATA_DIRECTORY=/home/gpadmin/gpdata/gpmaster/gpseg-1" >> /home/gpadmin/.bash_profile
source /opt/greenplum/greenplum_path.sh
cp $GPHOME/docs/cli_help/gpconfigs/gpinitsystem_config /home/gpadmin/gpinitsystem_config

# GpConfig Config
echo "MACHINE_LIST_FILE=/home/gpadmin/conf/seg_hosts" >> /home/gpadmin/gpinitsystem_config
echo "DATABASE_NAME=testDB" >> /home/gpadmin/gpinitsystem_config
sed -i "s/DATA_DIRECTORY=.*/DATA_DIRECTORY=\/home\/gpadmin\/gpdata\/gpdatap/g" /home/gpadmin/gpinitsystem_config
sed -i "s/MASTER_DIRECTORY=.*/MASTER_DIRECTORY=\/home\/gpadmin\/gpdata\/gpmaster/g" /home/gpadmin/gpinitsystem_config

# Data Directory Config
mkdir -p /home/gpadmin/gpdata/gpmaster
mkdir -p /home/gpadmin/gpdata/gpdatap
chown -R gpadmin:gpadmin /home/gpadmin/gpdata

# Install ed for install
rpm -ivh /vagrant/ed-1.1-3.3.el6.x86_64.rpm
