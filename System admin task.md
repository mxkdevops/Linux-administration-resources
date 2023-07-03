First things first 
$ ssh user@ip
$ ssh cloud_user@3.248.223.178
$ sudo -i
$ su -i
$env $PATH




# 1.System information

```
$uname -a 
$uname -r
$uptime
$ cat /etc/os-release
$ hostname
$ hostanem - I
$ last reboot
$date
$cal
$w
$whoami
$pwd
```
# 2.Hardware Information 
```
Display message in kernal ring buffer
$dmesg
Display CPU infroamtion
$ cat /proc/cpuinfo
#df
#df -h
#free -m
#free -h
Display PCI devices
$lspci -tv
$lsusb -tv
Display DMI/SMBIOS from
$dmidecode
Show infor about disk data
hdparm -i /dev/sda
Perform a read speed test on disk sda
$hdparm -i /dev/sda
Test for unreadable blocks on disk sda
badblocks -s /dev/sda
```
# 3. Performance monitoring and statistics 
```
# Display and manage the top processes
$top
$htop
# Display processor and virtual memory and I/Orelated statistics
$mpstat 1
$vmstat 1
$iostat 1

# Display the last 100 syslog messages  (Use /var/log/syslog for Debian based systems.)
$tail -100 /var/log/messages
# Capture and display all packets on interface eth0
$tcpdump -i eth0

# Monitor all traffic on port 80 ( HTTP )
$tcpdump -i eth0 'port 80'

# List all open files on the system
$lsof
$lsof -u user

# Display free and used memory ( -h for human readable, -m for MB, -g for GB.)
free -h

# Execute "df -h", showing periodic updates
watch df -h
```
Try to find the dig command
```
$ type -a dig
$ yum whatprovides dig
$ yum whatprovides host
$ sudo dnf whatprovides '*bin/dig'
$ sudo dnf install bind-utils
$ sudo yum install bind-utils
$ dig www.nixcraft.com
$ dig @1.1.1.1 google.com
$ dig @1.1.1.1 MX nixcraft.com
$ dig @1.1.1.1 AAAA yahoo.com
```
# 4. User management 
```
# Display the user and group ids of your current user.
id
# Display the last users who have logged onto the system.
last
# Show who is logged into the system.
who
# Show who is logged in and what they are doing.
w
# Create a group named "test".
groupadd test
# Create an account named john, with a comment of "John Smith" and create the user's home directory.
useradd -c "John Smith" -m john
# Delete the john account.
userdel john
# Add the john account to the sales group
usermod -aG sales john
```
# 5.File And Directory Command
```
# List all files in a long listing (detailed) format
ls -al

# Display the present working directory
pwd

# Create a directory
mkdir directory

# Remove (delete) file
rm file

# Remove the directory and its contents recursively
rm -r directory

# Force removal of file without prompting for confirmation
rm -f file

# Forcefully remove directory recursively
rm -rf directory

# Copy file1 to file2
cp file1 file2

# Copy source_directory recursively to destination. If destination exists, copy source_directory into destination, otherwise create destination with the contents of source_directory.
cp -r source_directory destination

# Rename or move file1 to file2. If file2 is an existing directory, move file1 into directory file2
mv file1 file2

# Create symbolic link to linkname
ln -s /path/to/file linkname

# Create an empty file or update the access and modification times of file.
touch file

# View the contents of file
cat file

# Browse through a text file
less file

# Display the first 10 lines of file
head file

# Display the last 10 lines of file
tail file

# Display the last 10 lines of file and "follow" the file as it grows.
tail -f file
```

# 6. Process Discovery 
```
#top
#ss -lpt
#ps -ef 
#ps aux
#ps axjf
#ps aux |less
#kill pid
#killall processname
#fg
#fg -n
```
# 7.File permission 
```
PERMISSION      EXAMPLE

         U   G   W
        rwx rwx rwx     chmod 777 filename
        rwx rwx r-x     chmod 775 filename
        rwx r-x r-x     chmod 755 filename
        rw- rw- r--     chmod 664 filename
        rw- r-- r--     chmod 644 filename

# NOTE: Use 777 sparingly!

        LEGEND
        U = User
        G = Group
        W = World

        r = Read
        w = write
        x = execute
        - = no access

```
# 8.Networking 
```
# Display all network interfaces and IP address
ip a

# Display eth0 address and details
ip addr show dev eth0

# Query or control network driver and hardware settings
ethtool eth0

# Send ICMP echo request to host
ping host

# Display whois information for domain
whois domain

# Display DNS information for domain
dig domain

# Reverse lookup of IP_ADDRESS
dig -x IP_ADDRESS

# Display DNS IP address for domain
host domain

# Display the network address of the host name.
hostname -i

# Display all local IP addresses of the host.
hostname -I

# Download http://domain.com/file
wget http://domain.com/file

# Display listening tcp and udp ports and corresponding programs
netstat -nutlp
```
# 9
```
# Create tar named archive.tar containing directory.
tar cf archive.tar directory

# Extract the contents from archive.tar.
tar xf archive.tar

# Create a gzip compressed tar file name archive.tar.gz.
tar czf archive.tar.gz directory

# Extract a gzip compressed tar file.
tar xzf archive.tar.gz

# Create a tar file with bzip2 compression
tar cjf archive.tar.bz2 directory

# Extract a bzip2 compressed tar file.
tar xjf archive.tar.bz2
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
```

Step 1. Package Installation: Run the following command to install net-tools package:
```
# dnf install net-tools
CentOS-8 – AppStream
…………………….
Installed:
  net-tools-2.0-0.51.20160912git.el8.x86_64

Complete!
```
Check now route table 
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

Check layer 3 ping command
```
ping -I eth1 10.0.1.11
ping 10.0.1.20
#curl -I 10.0.1.20
```
Check layer 2 command arping
```
#arping 10.0.1.11
```

# First, let's see if NetworkManager is even running:
```
[cloud_user@host]$ systemctl status NetworkManager


That will show us that is it. Now let's get a list of active connections.
[cloud_user@host]$ nmcli c show

We'll see a line for ens5. That's the one we're going to be querying.

Get the Information
$ nmcli d show ens5


