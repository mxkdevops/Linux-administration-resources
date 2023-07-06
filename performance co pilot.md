#  COnfigure  Performance co pilot in Redhat server 

```
Listing all package
$yum list all

Lisiitng the repository list 
$ yum repolist

#Login to ssh terminal
$ ssh cloud_user@3.253.46.19

#Become root user using 'sudo -i` command 
$ sudo -i
# INstall pcm main package using yum repository 
$yum install pcp

#Enable pmcd package 
$systemctl enable --now pmcd
$systemctl start pmcd

#Confirm the status of the service 
$systemctl status pmcd

#Enable pmlogger service
$systemctl  enable --now pmlogger
#check the status of pmlogger
$ systemctl status pmlogger

# Check the log file
$ cd var/log/pcp/pcmlogger/
#Check the pmstat command by default every 5 seconds 
$pmstat
# Pmstat check every 1s with using -t and mention 1s option 
$pmstat -t 1s
#Pmstat every 1s and after 10 second stop : use T with 10s 
$pmstat -t 1s -T 10s

$pmstat -a 0e7cd22c7f1c.mylabserver.com -S '@Thu Jul 6 06:00:00 UTC 2023
' -T 'Thu Jul  6 07:00:00 AM UTC 2023' 
```
```
Check pminfo with grep or less
$pminfo |grep cpu
$pminfo |less cpu
$pminfo -t |less cpu
$pminfo -t |grep cpu |less
```
#Pmval/pmrep
View system data by matrics; pmrep is considered mora human readable
```

```
