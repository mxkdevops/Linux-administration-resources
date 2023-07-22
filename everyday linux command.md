## Everyday run this linux command 
```
#ssh to cloud server 
$ ssh cloud_user@63.33.71.33

#Become root user 
$ sudo -i

#cheeck current working  directory
$ pwd

# create a direcotry called devops
$ mkdir devops

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




