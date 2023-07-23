# Hardening Apache web server 

## Configuring Encryption-ssl , virtualhost, Letscnrypt,DNS , Domain , Firewall and SELinux
## Create a virtual host 

```
# Create a html directory for our domain
  sudo mkdir -p /var/www/<OUR_DOMAIN>/html
  sudo mkdir -p /var/www/raheel.mylabserver.com/html
  sudo mkdir /var/www/raheel.mylabserver.com/log
  hostname
  echo $USER
  ll /var/www/raheel.mylabserver.com
```
```
#Set ownership of the file 
 ll /var/www/raheel.mylabserver.com
 sudo chown -R $USER:$USER /var/www/raheel.mylabserver.com/html
 sudo chown -R $USER:$USER /var/www/raheel.mylabserver.com/log
# Set permisin
sudo chmod -R 755 /var/www/


```
