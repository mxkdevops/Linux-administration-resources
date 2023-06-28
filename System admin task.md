# Gathering System information

```
#uptime
#df
#df -h
#free -m
#free -h 
```
Display a list of open files 
```
#lsof
#lsof | less
#lsof -u cloud_user |wc -l
lsof -u cloud_user
lsof -i 
#umount /run/user/1001/gvfs
```
# Process Discovery 
```
#top
#ss -lpt
#ps aux
#ps axjf
#ps aux |less
```
# Connection testing :: orders and tools 
```
OSI layers
Layer 2 : Data link layer (MAC) -switch vlan configuration , mac addressing , ip conflict : 'arping'
Layer 3 : Network layer (IP) - addressing and routing , bandwidth , network authentication : 'ping , traceroute , tracepath '
Layer 4 : Transport -blocked ports , firewalls :' SS , telent , tcpdump , nc '
Layer 5-7 : Application or service configuration : 'dig , service tools'
```
# Checking connectivity issue
```
# curl -I mxzaman.com
# nmcli
#ncmli device show
#ss -lntp |grep : 80
#ss -lntp
#sudo -i
#systemctl start httpd
#yum install httpd
#systemctl enable httpd
#systemctl status httpd
#ss lntp |grep :80
```
check the firewall or iptable status 
```
#systemctl status {firewalld, iptables}
#systemctl install firewalld
#systemctl start firewalld
#systemctl status firewalld
```
Check the running config for firewalld
```
#firewall-cmd --list-all

add http in the firewall
#firewall-cmd --permanent --add-service=http
#firewall-cmd --list-all

restart the firewall
#systemctl reload firewall-cmd

```
Cheking IP routing tabel 
```
#route -n  ( not found error ) ----> new command #ip r
-bash: route: command not found
Start googling found that its replace with IP command

Step 1. Package Installation: Run the following command to install net-tools package:
```
# dnf install net-tools
CentOS-8 – AppStream
…………………….
Installed:
  net-tools-2.0-0.51.20160912git.el8.x86_64

Complete!
```
```
[root@0e7cd22c7f1c ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.31.96.1     0.0.0.0         UG    100    0        0 ens5
172.31.96.0     0.0.0.0         255.255.240.0   U     100    0        0 ens5

```
add 2 entry in ip table
```
# ip route add 10.0.1.0/24 dev eth0 tab 1
# ip route add 10.0.1.0/24 dev eth1 tab 2
 # ip route show tab 1 

 add a rule 
 #ip rule add from 10.0.1.0/24 tab 1
 #ip rule add from 10.0.1.0/24 tab 2 
 
 ```






