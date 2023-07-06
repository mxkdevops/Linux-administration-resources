```
#SSH to 

#ssh cloud_user@<PUBLIC_IP_ADDRESS>
$sudo -i

# Check the running services 

$systemctl list-units --type=service --state=running

#Dump all of our log
$journalctl

# Continue to follow with -ef option
$journalctl -ef

# Only show the kernal message with -k opetion
$journalctl -k
#Search with specific program such as sshd uing -u option
$ journalctl -u sshd
```
