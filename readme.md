# GreenPlum Vagrant 环境

## 环境要求
1. VirtualBox
2. Packer
3. Vagrant
4. 下载greenplum-db-4.3.6.2-build-1-RHEL5-x86_64.bin到本目录

**注意：只测试过greenplum-db-4.3.6.2-build-1-RHEL5-x86_64.bin安装**

## 安装

### 安装脚本执行
```
# ./RunMe.sh greenplum-db-4.3.6.2-build-1-RHEL5-x86_64.bin
```

### 安装GP步骤
```
# vagrant ssh mdw
mdw# su gpadmin
     passwd:gpadmin
mdw# cd /vagrant
mdw# ./gpinstall.sh
```

## GP配置

### 登陆
用户名:gpadmin
密码:gpadmin

### 4个节点(没有配置master standy和mirror)
- 主节点   mdw 192.168.2.100
- 工作节点 sdw1 192.168.2.101  
- 工作节点 sdw2 192.168.2.102 
- 工作节点 sdw2 192.168.2.103  

