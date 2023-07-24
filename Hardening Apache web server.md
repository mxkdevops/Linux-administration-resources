## Log in to the server using the credentials provided:
```
ssh cloud_user@<PUBLIC_IP_ADDRESS>
```
## Install, Start, and Enable Apache Web Server
#Install Apache web server:
```
sudo yum install httpd -y
```
#Start Apache web server:
```
sudo systemctl start httpd
```
#Check the status of Apache web server:
```
sudo systemctl status httpd
```
#Enable Apache to start at boot:
```
sudo systemctl enable httpd
```
## Install Start and Enable firewalld
#Install firewalld:
```
sudo yum install firewalld
```
#Start firewalld:
```
sudo systemctl start firewalld
```
#Check the status of firewalld:
```
sudo systemctl status firewalld
```
#Enable firewalld:
```
sudo systemctl enable firewalld
```
## Implement Permanent Firewall Rules to Allow Traffic on Ports 80 and 22
#Open port 80:
```
sudo firewall-cmd --add-port=80/tcp --permanent
```
#Open port 22:
```
sudo firewall-cmd --add-port=22/tcp --permanent
```
#Reload:
```
sudo firewall-cmd --reload
```
## Re-Log in via SSH to Confirm Your Firewall Configuration Is Correct and Access the Web Server Default Page via the Browser
Log out:

exit
#Log back in via SSH:
```
ssh cloud_user@<SERVER_PUBLIC_IP>
```
Open a new web browser tab, and navigate to http://<SERVER_PUBLIC_IP>. You should then see the Apache test page.
