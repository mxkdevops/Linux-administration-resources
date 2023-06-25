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
# Become a root user and perform the below operation
```
#sudo -i
#cd /usr/local
#tar -xvf /home/cloud_user/Desktop/apache-tomcat-9.0.76.tar.gz
#mv apache-tomcat-9.0.76 tomcat9
#useradd -r tomcat
#chown -R tomcat:tomcat /usr/local/tomcat9
#ll
#ll tomcat9/
#vim /etc/systemd/system/tomcat.service
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
restart the service using 'systemctl'
#systemctl satrt tomcat.service
#systemctl enable tomcat.service
#systemctl status tomcat.service

Go to browser check with public ip :8080
add a admin user 
vim conf/tomcat-users.xml












