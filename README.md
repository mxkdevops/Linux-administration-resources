```
#SSH to 

#ssh cloud_user@<PUBLIC_IP_ADDRESS>
$sudo -i
$grep 'httpd' /etc/yum.conf

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
