## Everyday run this linux command 
```
#ssh to cloud server 
$ ssh cloud_user@63.33.71.33

#Become root user 
$ sudo -i

#cheeck current working  directory
$ pwd

# check uptime 
$ uptime 
$whoami
$id
$lastlogin
$wc -l /etc/passwd ---> count line 

# check memeory and process and storage
$ ps aux
$ps -u root
$ps -u cloud_user
$ free -m
$df -h
$ du -ah
$du -sh
$top
$dmesg
$iostat l

# Check port are listening
$ lsof -l -p -n |grep LISTEN
$lsof -i:8080
$lsof -i :22
$ss -tulpn |grep LISTEN 


# System log monitor
$cd /var/log
$ls -la /var/log
$cat /var/log/syslog
$cat /var/log.auth.log
$ tail -10 /var/log/auth.log
$ tail -f /var/log/auth.log


#Check the long list file with permission
$ ls -la

# copy files
$ cp file1 file2

#check file type
$ file file1
#Create directory with -p option 
$mkdir -p /opt/dev/ops/devops/test
```

## Create a soft link
```
$ln -s /opt/dev/ops/devops/test/commands.txt cmds
```


## Change the hostname 
```
$vim /etc/hostname
$hostname red-hat.mylabserver.com
```

## Grep Command file search 
```
$grep word filename
$grep firewall anaconda-ks.cfg
$grep -i firewall anaconda-ks.cfg  [-i option will ignore the case sensitivity]
$grep -R SELINUX /etc/*
$grep -vi SELINUX /etc/* [reverse search]
```
## less command 
```
less /etc/passwd
```
## more command
```
more /etc/passwd
```
## head first 10 lines
```
head /etc/passwd
head -2 /etc/passwd
head -5 /etc/passwd
tail -10 /var/log/messages
tail -f /var/log/messages
```

## filtering with colume
```
cut -d: -f1 /etc/passwd
cut -d: -f3 /etc/passwd
awk -F':' '{print $1}' /etc/passwd
```


## search and replace 
```
vim 
:%s/coronavirus/covid19
:%s/coronavirus/covid19/g [all items match will replace ]
```
```
sed
sed  's/coronavirus/covid19/g' samplefile.txt
sed  's/name_from/name_to/g' *
sed -i 's/name_from/name_to/g' filename 
```
## dump file to null
```
yum install vim -y > /dev/null
cat /dev/null
cat /dev/null > /tmp/sysinfo.txt
```

