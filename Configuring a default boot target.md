# Check the default boot target 

```
The current default target is set to to multi-user.target. Use the appropiate command to verify
$ sudo -i
Check the default target 
$ sytemctl set-default graphical.target

Change the deafult target
$ systemctl set-default graphical.target

Check the default target again
$ systemctl get-default 

```
