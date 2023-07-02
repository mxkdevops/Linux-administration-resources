# Step 1: Install APache Web server 
```
$ ssh cloud_user@34.241.248.198
$sudo yum update
```
# Step 2 : Start Ap



...

Part2 - Configure Firewall for apacehe and SSH
```
sudo yum install firewalld
sudo systemctl status firewalld
sudo systemctl start firewalld
sudo systemct enable firewalld
sudo systemctl reload firewalld
sudo firewall-cmd--permanent  --add-port =80/tcp
sudo firewall-cmd--permaent --add-port=22/tcp
sudo firewalld-cmd  --reload
sudo systemctl enable firewalld

````
