# Install java 11 OpenJDK
You need to install the java-11-openjdk-devel package:
```
sudo dnf install java-11-openjdk-devel
```
Once it's installed, check the version of Java to ensure it has installed properly and is set as the default for the system.
```
java --version
```

# Obtain Tomcat version 9 from the Apache Tomcat Website
[Go to the webpage to get the latest version of Tomcat 9:]

(https://tomcat.apache.org/download-90.cgi)
```
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.tar.gz
ll
```
# Install and Configure Tomcat, Create the User and Service, Then Start It and Ensure It Starts on a System Reboot
You need to expand the compressed Tomcat files into the location it will be put.

Change to the root user (or add 'sudo' at the beginning of the commands that follow)
```
sudo su -
```
Change to the location we will use for the tomcat files.
```
cd /usr/local
```
Extract the downloaded file to the current location. Note: replace THE-TOMCAT-FILE-YOU-COPIED-EARLIER with the correct file that was downloaded.
```
tar -xvf /home/cloud_user/THE-TOMCAT-FILE-YOU-COPIED-COPIED-EARLIER
```
Change the name of the Tomcat folder to tomcat9. Note the version you get may be newer than this one. Change the name as needed:
```
mv apache-tomcat-9.0.31 tomcat9
```
Add the tomcat user as a system account:
```
useradd -r tomcat
```
Change the permissions of the tomcat9 folder so the tomcat user can use it:
```
chown -R tomcat:tomcat /usr/local/tomcat9
```
Create the tomcat service. Use an editor (like Vim) to create a file /etc/systemd/system/tomcat.service:
```
vim /etc/systemd/system/tomcat.service
```
Add the following contents (and note that if you copy and paste whats below, ensure the lines in your file do not have leading spaces):
```
[Unit]
Description=Apache Tomcat
After=syslog.target network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment=CATALINA_PID=/usr/local/tomcat9/temp/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat9
Environment=CATALINA_BASE=/usr/local/tomcat9

ExecStart=/usr/local/tomcat9/bin/catalina.sh start
ExecStop=/usr/local/tomcat9/bin/catalina.sh stop

RestartSec=12
Restart=always
[Install]
WantedBy=multi-user.target

```
Next we need to have the system recognize there is a new service. We can use the 'daemon-reload' option for systemctl:
```
systemctl daemon-reload
```
Now we can start the service, set it to restart on system boot, and check if it's currently running:
```
systemctl start tomcat.service
systemctl enable tomcat.service
systemctl status tomcat.service
```
Check that Tomcat works by going to your server's public IP address, on port 8080, in a web browser:
```
http://YOUR_SERVER_IP:8080
```
# Add an admin User for Tomcat

To add an admin user for Tomcat, you need to edit the tomcat-users.xml file:
```
cd /usr/local/tomcat9/
vim conf/tomcat-users.xml
```
Go to the bottom of the file, and put the following just before the </tomcat-users> end block. Don't forget to change the YOURPASSWORDHERE to be your own password, whatever you like:
```
<role rolename="admin-gui,manager-gui"/> 
<user username="admin" password="YOURPASSWORDHERE" roles="admin-gui,manager-gui"/>
```
# Modify Tomcat so You Can Log in Remotely

The next step is to allow access to the management web pages from the internet.

Edit the , webapps/manager/META-INF/context.xml, file:
```
vim webapps/manager/META-INF/context.xml
```
Get to the following line:
```
allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
```
Change it to this:
```
allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1 |.*" />
```
# Restart Tomcat and Check Remote Connectivity

The next task is to restart the Tomcat and ensure it is accessible, then try logging in:
```
systemctl restart tomcat
```
Go to the public IP address of the lab server and test out logging in via the port 8080.

Check that Tomcat works by going to your server's web page on port 8080
```
http://YOURSERVERIP:8080
```
Log in with the username and password you completed on Step 5: Add an admin User for Tomcat

You should be able to log in and manage the Tomcat installation.






