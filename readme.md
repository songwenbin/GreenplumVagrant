# GreenPlum Vagrant 环境

## 环境要求
1. VirtualBox
2. Packer
3. Vagrant

## 安装

### 安装脚本执行
```
# ./RunMe.sh
```

### 安装GP步骤
```
# vagrant ssh mdw
mdw# su gpadmin
     passwd:gpadmin
mdw# cd /opt/greenplum
mdw# source ./greenplum_path.sh
mdw# cd /home/gpadmin
mdw# gpssh-exkeys -f conf/hostlist
mdw# gpinitsystem -c ./gpsysteminit_conf
```

