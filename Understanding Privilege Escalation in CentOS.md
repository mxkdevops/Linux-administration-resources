# Understanding Privilege Escalation in CentOS
Introduction
As a system administrator, most of your work can be done as your specific user. There are many tasks, however, that need to be done as the root user to work correctly. In this hands-on lab, you'll be able to practice different methods of privilege escalation.

Solution
Log in to the server using the credentials provided:
```
ssh cloud_user@<PUBLIC_IP_ADDRESS>
Add bob to sudoers File
Become root:

[cloud_user@Server1]$ sudo -i
Enter the cloud_user password.
```

Open the sudoers file:
```
[root@Server1]# visudo
Add the following somewhere after the root permissions are defined:

bob  ALL=(ALL)	NOPASSWD: ALL
Allow adam to Use the journalctl Command as root
Add the following beneath the bob line we just added:

adam  ALL=(root)  NOPASSWD: /bin/journalctl
Save and exit the file by pressing Escape followed by :wq.
```
Switch to bob:
```
[root@Server1]# su - bob
Try to install PHP:

[bob@Server1]$ yum install php
We should get an error message saying it needs to be run as root.

Try it again with root:

[bob@Server1]$ sudo yum install php
This time, it should work.
```
Enter n at the prompt.

Log out:
```
[bob@Server1]$ logout
Switch to adam:

[root@Server1]# su - adam
Run the following:

[adam@Server1]$ sudo journalctl
We should see it works.

Try to install PHP:

[adam@Server1]$ sudo yum install php
```
When we enter the cloud_user password, it will fail. (This is what should happen, so we're good.)
