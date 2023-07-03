# Review Current DNS Configuration
See if the system can resolve hostnames to IP addresses:
```
host www.google.com
```
Note that the command times out.


#Check to see what DNS server entries we have in the /etc/resolv.conf file:
```
cat /etc/resolv.conf
```
Note that we do not have any DNS entries listed.

Review our network connections:
```
nmcli con show
```
Our default connection name should be System ens5. Review our DNS IP settings:
```
nmcli -f ipv4.dns con show "System ens5"
```
This system obviously does not have any DNS servers configured for use.

# Configure Your System to Use Your Network's DNS
Modify the system's default connection to use the network's DNS server:
```
sudo nmcli con mod "System ens5" ipv4.dns "10.0.0.2"
Verify the settings using the nmcli command and then checking the /etc/resolv.conf file:

nmcli -f ipv4.dns con show "System ens5"
cat /etc/resolv.conf
We need to reactivate the system's network connection for the change to take effect:

sudo nmcli con up "System ens5"
Verify our settings once more:

cat /etc/resolv.conf
Now, attempt to resolve a hostname to an IP address:

host www.google.com
Our system should be able to resolve an IP address for the domain name.
```
