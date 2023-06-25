
vpn server : 10.0.1.0
subnet:10.0.1.0/24
server1 : PUBLIC IP 
Host firewall
eth0

Web server : 10.0.1.20
subnet:10.0.1.0/24
Node1
Host firewall
eth0

VPN client 10.0.2.11
Client1 : Public IP 
subnet:10.0.2.0/24
Host firewall
eth0

FW zone 
10.8.0.0/24
80/tcp

#sudo -i # become root user
# yum install -y epel-release
#yum install -y openvpn
#firewall-cmd --permanent --add=port=1194/tcp
#firewall-cmd --permanet  --add-masquerade
#firewall-cmd --reload
#yum install -y easy-rsa


# create a directory under openvpn
#mkdir /etc/openvpn/easy-rsa
#cd /etc/openvpn/easy-rsa/
PATH=$PATH:/usr/share/easy-rsa/3.0.3/
#easyrsa init-pki
/etc/openvpn/easy-rsa/pki
easyrsa build-ca



