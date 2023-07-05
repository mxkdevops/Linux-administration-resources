Working with System Service Log Files Using the Journal Control
Introduction
Troubleshooting is an important part of working with services through systemd. In this hands-on lab, we will learn how to view system service log files using the Journal Control utility. At the end of this hands-on lab, you will know how to use the built-in journalctl utility to view and troubleshoot system services.

Connecting to the Lab
Open your terminal application, and run the following command. (Remember to replace <PUBLIC_IP> with the public IP you were provided on the lab instructions page.)
ssh cloud_user@&lt;PUBLIC_IP&gt;
Enter your password at the prompt.
Check the Web Server Configuration File
Change to the root account.
sudo su -
Check the status of the web service.
systemctl status httpd.service
Attempt to start the web service.
systemctl start httpd.service
After the service fails to start, check the journal.
journalctl -u httpd.service
Check the directory where the httpd configuration file should be.
ls /etc/httpd/conf
Restore the original httpd configuration file.
mv /etc/httpd/conf/httpd.conf.bkup /etc/httpd/conf/httpd.conf
Restart the service.
systemctl restart httpd.service
Verify That the Web Server Service Is Running
Check the status of the service.
systemctl status httpd.service
Navigate to the local web page.
elinks http://localhost
