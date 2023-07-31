```
#ssh to account
ssh cloud_user@52.87.246.4
#Become a root user
sudo -i
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



```
#SSH to 

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
