### Solution
To get started, we need to log in to our servers and set up our firewall:

### Log in to server and the client using the provided credentials:
```
ssh cloud_user@<PUBLIC_IP>
```
### Become the root user for the server:
```
sudo -i
```
### To complete the tasks in this review, several ports need to be open between the two systems. Check the firewall service:
```
systemctl status firewalld
```
### Then open ports and services on the server:
```
firewall-cmd --add-port={80,443,8080,20,21,22,25,2489,5901}/tcp
firewall-cmd --add-port={80,443,8080,20,21,22,25,2489,5901}/udp
firewall-cmd --add-service=iscsi-target
```
### You can check the status with;
```
`firewall-cmd --list-ports`
```
and
```
`firewall-cmd --list-services`
```
### Consider, should you write these to the permenent file in case the server restarts ?

... --runtime-to-permanent ...

### Set Up our Local git Repo
Install git on the server:
```
yum install git -y
```
### Switch back to the cloud_user:
```
su - cloud_user
```
### Initialize the git repo:
```
git init /home/cloud_user/mysite

git config --global user.name "ACloud Guru"

git config --global user.email "ACGG@Linuxacademy.com"
```
### Change the directory into mysite:
```
cd mysite
echo some text into a file README.md:

echo "This is text" > README.md
After creating the README.md file, check the status, and add and commit it to the repo with the comment "Version 1":

git add README.md

git status

git commit -m "Version 1"
```
### Create the SSH Key and Copy it from client to server
Start this on server:

### Create an SSH key, excepting all the defaults, and leave the passphrase empty:
```
ssh-keygen
```
### In the server window, copy the SSH key to the client. The easiest way to make this happen is to use ssh-copy-id:
```
ssh-copy-id cloud_user@<CLIENT_PRIVATE_IP>
```
### After being prompted for a password, the key will be copied over and set up.

### Test the connection:
```
ssh cloud_user@<CLIENT_PRIVATE_IP>
Disconnect:
logout
```
### Create a List, Memory, and Server Load Report
### We need to run three reports as the cloud_user on server:

### Create process list report:
```
ps aux | head -n 11 > /home/cloud_user/process-list.txt
```
### Create memory report:
```
free -hg > /home/cloud_user/mem-stats.txt
```
### Become the root for the next part:
```
sudo -i
```
### Create Server Load report:
```
yum install sysstat -y
```
### Create the report:
```
iostat -c 5 6 > /home/cloud_user/sys-log.txt
```
### Return to cloud_user:
```
su - cloud_user
```
### List out the files we just created:
```
ll
Check the information:
cat *.txt
```
### We see the information currently in our files.

### Install the iptraf Package
Complete the following on server:

Become the root user:

sudo -i
### Install the package needed for iptraf:
```
yum install iptraf -y
```
### Log information with iptraf:
```
iptraf-ng -i all -t 1 -B
```
### Check that there is a log for it in /var/log/iptraf-ng/:
```
ll /var/log/iptraf-ng/
```
### cat the information to check that the log is populated. Make sure to use the unique number present in the log name:
```
cat /var/log/iptraf-ng/ip_traffic-UNIQUE_NUMBER.log
```
### Update, Reboot, and Verify the Kernel on the client
Update the kernel on the client:

###First, check that our kernel is in the client:
```
ll
Become the root user:
sudo -i
Install the kernel:
yum install /home/cloud_user/kernel-3.10.0-862.el7.x86_64.rpm
Reboot the server and verify the kernel version using:
reboot
Log back in to client server.

List out the kernel:
ll
Check that we are running the correct kernel:
uname -a
```
The kernel names match.

### Update the Operating System| Perform these steps on the client:
```
Become the root user:
sudo -i
Update all packages:
yum update -y
Clean the unneeded packages from our system:
yum clean all
(Optional) Remove chaching data:
du -sh /var/cache/yum
```
### Install HTTPD on the server
Perform the following on the server:

### Install the latest Apache server:
```
yum install httpd -y
Enable the server:
systemctl enable httpd
Start the server:
systemctl start httpd
```
### Move the provided web pages from the root user newsite directory to where they can be accessed via the web server, and make sure they work:
```
mv newsite/* /var/www/html/
On the client server, curl the following:

curl <SERVER_PRIVATE_IP>/question.html
We are told that we can't currently access this information.
Return to the server and change the directory:
cd /var/www/html/
List the information in here:
ls -l
It looks right, but let's try another view:
ls -lZ
```
### We now see that the permissions are not set correctly. Check for the test files and move them.

### Fix the issue by running the following:
```
restorecon -R /var/www/html
Check again and make sure it is now going to httpd_sus_content:
ls -lZ
Back on the client, try to curl again:

curl <SERVER_PRIVATE_IP>/question.html
When we get the question back, curl the answer:

curl <SERVER_PRIVATE_IP>/answer.html
We get back our answer.
```

### Encrypt HTTP Traffic from the CLIENT to the SERVER
On the client, enable port forwarding with the following command:
```
ssh -f -L 8080:<SERVER_PRIVATE_IP>:80 cloud_user@<SERVER_PRIVATE_IP> -nNT
Now test it using:

curl localhost:8080/answer.html
You should receive the HTML page without error.
```
### Set up Postfix
Start this section on the server:
```
Set up postfix:
postconf -e "mydestination = <SERVER_PRIVATE_IP>, localhost.localdomain, localhost"

postconf -e "mynetworks = 127.0.0.0/8, 10.0.0.1/24"

postconf -e "inet_interfaces = all"
Restart postfix:
systemctl restart postfix
Install mailx:
yum install mailx -y
```
### As root, send a test message:
```
mail  -s "this is a subject" cloud_user@[<SERVER_PRIVATE_IP>] 	
This is content
Hello
Press Ctl + D to finish.
```
### Check that it arrived:
```
tail /var/log/maillog
Switch to cloud_user:
su - cloud_user
```

### Review the content to make sure we can read the information:
```
cat /var/spool/mail/cloud_user
```
### Set Up LVM Volumes
Perform these steps in server:
Become root:
```
sudo -i
```
### Check what is already in place and what you have to work with. Take note of the device names:
```
df -h
fdisk -l
```
### To get the software to manage LVM you need to run:
```
yum install lvm2 -y

pvcreate /dev/nvme1n1  /dev/nvme2n1

vgcreate  myvol /dev/nvme1n1  /dev/nvme2n1

lvcreate -l 100%FREE -n mydata myvol
```
### Now add a file system
```
mkfs.ext4 /dev/myvol/mydata
Now make a directory to use as a mountpoint:

mkdir /mnt/data
Edit /etc/fstab to make the mapping permenant:

vim /etc/fstab
Add the following line of code at the bottom of the page:

/dev/myvol/mydata /mnt/data   ext4    defaults    0 0
Now mount all volumes,

mount -a
```
### Change our directory:
```
cd /mnt/data
```
### Verify the logical volume is mounted correctly and that you can read and write to it.
```
mount
df -h
touch /mnt/data/test.txt
List out the information to make sure we have what we need:

ls -la /mnt/data/test.txt
View the information:

df -h
```
### Configure the iSCSI Target and Start the Required Service
As root on the EXAM REVIEW SERVER, check that you have an unused volume:
```
df -h
fdisk -l
```
### Get the tools needed:
```
yum  install targetcli iscsi-initiator-utils -y

targetcli
Inside the cli, enter the following:

backstores/block create exam /dev/nvme3n1

iscsi/ create iqn.2018-11.com.mylabserver:t1

cd iscsi/iqn.2018-11.com.mylabserver:t1/tpg1/

ls

luns/ create /backstores/block/exam

acls/ create iqn.2018-11.com.mylabserver:client
Exit out:
```
exit
### Then finish the server-side configuration by activating the service:
```
systemctl enable target

systemctl start target

systemctl status target
```
###We should find that it is Active.

Create the Client Initiator Name on client:
```
yum install iscsi-initiator-utils
```
### Edit the following:
```
vim /etc/iscsi/initiatorname.iscsi
```
### Change the information to read:
```
InitiatorName=iqn.2018-11.com.mylabserver:client
Save and quit the document with :wq!.

Start and enable iscsi:

systemctl start iscsi

systemctl enable iscsi
```
### Check the Firewall to ensure that the necessary services are allowed.
```
There are two similar commands that need to be run at this stage. ``` iscsiadm --mode discovery --type sendtargets --portal <PRIVATE_IP_OF_SERVER>

iscsiadm --mode node  --targetname iqn.2018-11.com.mylabserver:t1  --portal <PRIVATE_IP_OF_SERVER> --login
```
### Once that's done you can run:
```
lsblk --scsi
```
### We'll see an iSCSI device presented.
```
Block SSH Without Using a Firewall
```
### To set up portmapper, on the server run the following:
```
echo "sshd: <CLIENT_IP>" >> /etc/hosts.deny
Restart the system:
systemctl restart sshd
```
From the client server, verify SSH is blocked:
```
ssh cloud_user@<SERVER_IP>
The attempted connection should fail with a message: "Connection reset by peer"
```
