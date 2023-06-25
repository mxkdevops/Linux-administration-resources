# Install java 11 OpenJDK
#sudo dnf install java-11-openjdk-devel

# check the version of java 11 openJDK
#java --version
#wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.tar.gz
#ll
# Become a root user
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












