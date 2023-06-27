# Troubleshoot Network Connectivity on Linux
Introduction
There are a variety of tools available to test the connections between our servers, including nc, ping, dig, and others. In this lab, we'll leverage these networking tools and others to discover what is preventing the connection between our MySQL server and client.


Connect to both the app and db server using the credentials provided:
```
ssh cloud_user@<PUBLIC_IP_ADDRESS>
```
Become the root user, entering the provided password when prompted:
```
sudo -i
```
# Reproduce the Issue
Using the app server, try to connect to the db server:
```
mysql -u remote -h 10.0.1.105 -pastrongpass
```
# Discover the Source of the Issue
Using the app server, run ping to verify connectivity:
```
ping 10.0.1.105
```
Note: Use CTRL + C to stop ping.

Using the db server, stop the MariaDB service:
```
systemctl stop mariadb
```
Using the db server, run the netcat utility to open a listening port of port 3306:
```
nc -l 3306
```
Using the app server, try to connect to private IP address of the db server on port 3306:
```
nc 10.0.1.105 3306
```
Using the db server, exit the netcat utility listener by pressing CTRL + C.
Using the db server, restart the MariaDB service:
```
systemctl enable --now mariadb
Using the db server, check if a firewall rule is blocking the MariaDB service:
firewall-cmd --list-all
```
# Resolve the Issue
Using the db server, add a firewall rule to add the MariaDB service:
```
firewall-cmd --permanent --zone=public --add-service=mysql
Using the db server, reload the firewall configuration:
firewall-cmd --reload
Return to the app server for the final time and connect to the db server:
mysql -u remote -h 10.0.1.105 -pastrongpass
At the MariaDB prompt, display databases:
show databases;
At the MariaDB prompt, create a new database:
create database purchases;
At the MariaDB prompt, display databases to verify the newly created database:
show databases;
Return to the db server one final time to confirm connectivity:
mysql
At the MariaDB prompt, display databases to confirm connection to the appropriate MariaDB instance:
show databases;
```
