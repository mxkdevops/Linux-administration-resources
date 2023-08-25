
## Troublesooting toolbox
```
https://github.com/mxkdevops/jenkins/blob/main/jenkins%20troubleshoot.txt
```
## Install Jenkins 
```
1. Install jenkins from jenkins webiste
https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos

2. Install jenkins following acloudguru tutorial

https://learn.acloud.guru/course/93e6884d-ac98-49b6-a9cd-5e357d2dbb41/learn/
f0ef6872-668c-4ba4-96c1-ad7d6e90b686/7376e1b8-001b-48e0-8c0c-e1ebe8ed2f03/lab/
e29e7625-6fec-4287-9495-8c1ea470ebcd
```
## Install Terraform
```
https://developer.hashicorp.com/terraform/tutorials/docker-get-started/install-cli
```
## NGINX server in less than a minute using Docker
```
https://developer.hashicorp.com/terraform/tutorials/docker-get-started/install-cli

```
## Install docker in ubunu | Install using the apt repository
```
https://docs.docker.com/engine/install/ubuntu/
```


```
#ssh to account
ssh cloud_user@52.87.246.4
#Become a root user
sudo -i
```
## Useful commands
```
#List of httpd module 
sudo yum module list| grep httpd
#check httpd not install 
rpm -q httpd
rpm -q tcpdump
fdisk -l
df -h

cat /etc/resolv.conf
ip a
ip addr show
ifconfig -a

nmcli dev show |grep DNS
rpm -qa |grep bind-utils 

First we'll create the physical volumes:

pvcreate /dev/nvme1n1 /dev/nvme2n1
Next we'll create the volume group:

vgcreate vdoDev /dev/nvme1n1 /dev/nvme2n1
Finally, we'll create the logical volume:

lvcreate -n vdoLV -l 100%FREE vdoDev
Now we have a single 40G device that we can set VDO up with. To create the VDO device, run this:

vdo create --name=RHCE --device=/dev/vdoDev/vdoLV --vdoLogicalSize=150G --sparseIndex=enabled
```

## Generate a SSH key 
```
#Generate a ssh key
$ ssh-keygen
#copy it over to private of the other server
ssh-copy-id <server2_PRIVATE_IP>
```
## Configure SSH to use a different Port on CentOS
#Login to your server and open the OpenSSH server configuration file, /etc/ssh/sshd_config for editing.
```
vim /etc/ssh/sshd_config
Uncomment the line, # Port 22 and set it to a desired port
```
## Open New SSH Port on Firewall
```
Install firewall 
$ sudo dnf install firewalld
$sudo firewall-cmd --zone=public --add-port=22/ssh --permanent
```
## add a new port to firewall and load firewall and list the all port 
```
$firewall-cmd --add-port=3456/tcp --permanent
$sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
$firewall-cmd --reload
$ firewall-cmd --list-ports
```
## start/stop/enable/disable/mask/unmask firewalld
```
$ sudo systemctl start firewalld
$ sudo systemctl enable firewalld
$ sudo systemctl stop firewalld
$ sudo systemctl disable firewalld
$ sudo systemctl mask firewalld
$ sudo systemctl unmask firewalld

```

## Remove the port from the allowed ports to close it for the incoming traffic:
```
$ sudo firewall-cmd --remove-port=port-number/port-type
$ sudo firewall-cmd --zone=public --remove-port=8080/tcp --permanent
```
## Make the new settings persistent:
```
$ sudo firewall-cmd --runtime-to-permanent
```
## Verify the New SSH Port
After restarting the SSH service, check if the SSH port has been updated successfully. You can do this by running the following command:
```
ss -altnp4 | grep sshd
```

###################################
## User management 
```
#add a user to the system
useradd km443
#To create a new group we would run
groupadd superhero

#Set "sudo " group as the km443 accoutns primary group
usermod -g sudo km443

# Add "superhero " as a suplementary group on all three userss
usermod -aG superhero raheel
usemrod -aG superhero km443
usemrod -aG superhero mxkdevops

#Lock the km443 account
usermod -L km443
# set a password to unlock a account
passwd km443
# unlock the useraccount
usermod -U km443

```

## Grep , less and more command 
```
#ssh cloud_user@<PUBLIC_IP_ADDRESS>
$sudo -i
$grep 'httpd' /etc/yum.conf
$pminfo |grep cpu
$pminfo |less cpu
$pminfo -t |less cpu
$pminfo -t |grep cpu |less
```

# Check the running services 
```
$systemctl list-units --type=service --state=running

#Dump all of our log
$journalctl

# Continue to follow with -ef option
$journalctl -ef
```

# Only show the kernal message with -k opetion
```
$journalctl -k
#Search with specific program such as sshd uing -u option
$ journalctl -u sshd
#Search journalctl under its priority
$journalctl - p 4
```

# Persistent logging open
```
$ vim /etc/systemd/journald.conf
$ mkdir /var/log/journal
$chown root:systemd-journal /var/log/journal/
$chmod 2755 /var/log/journal/
$systemctl restart systemd-journald
$ll /var/log/journal/
$journalctl -xb
$journalctl --since '2023-07-06 11:00:00'

```
# Tar command for compression and archive files 

```
Create a tar archive with c=create v vervose f files 
$tar -cvf archive.tar my_files
$tar -czvf project.tar.gz project 
$tar -cjvf project.tar.bzip2 project

```

### Extract files from the tar
```
$ tar -xvf archieve.tar
$ tar -czvf project.tar.gz
$ tar -xjvf project.tar.bz2
```
### Curl command with options 
```
curl -O -L -C https://example.com/file.zip
```

### Wget command
```
wget -O output_file.txt http://example.com/file.txt
```









