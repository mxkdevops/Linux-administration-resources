## Monitor secuirty and conduct audit 
```
# Look for open port and eastblished connection ss-socket statistics , active tcp connection
$ss -t -o

#network mapping utility
$ yum install nmap
$ nmap localhost
$curl localhost

# Edit httpd.conf file
$ vim /etc/httpd/conf/httpd.conf

# search for listening port by / forward slash
#change the port from 80 to 8080
# Reastart the httpd
$ Systemctl resatrt httpd 
```
