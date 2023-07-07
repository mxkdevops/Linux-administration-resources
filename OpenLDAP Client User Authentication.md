# OpenLDAP Client User Authentication
#Completed 07/07/2023: 07:39 am 
#Create user autentication using OpenLDAP and PAM 
# Here is cloud guru lab link 
```
https://learn.acloud.guru/course/91f1ddd0-51e0-4007-b992-21d60983aeaf/learn/ea906e8f-db51-4ffe-83b7-e94f8ae97bdd/dfc636c0-5fa4-4054-89a6-6641662e4b49/lab/a847fe6a-9f62-4345-80dd-58a74e976ca6
```
# Install Required Packages 
```
yum -y install openldap compat-openldap openldap-clients openldap-servers nss-pam-ldapd

```
# Configure LDAP
With the daemon running, now we can set an LDAP password with:
```
With the daemon running, now we can set an LDAP password with the following command. The -s parameter determines what our LDAP Password will be later on in the lab.

[root@server ]# slappasswd -h {SSHA} -s password
That will run and print a hash out to the screen. Let's copy that, and then edit initial.ldif. Get into the right directory, then into the file:

[root@server ]# cd LDAP/LDAP
[root@server ]# vim initial.ldif
On the olcRootPW line, replace {SHAA} with our hash. The line should look something like this:

olcRootPW {SSHA}<OUR_HASH>
Save that file, and then run this so that it takes effect:

[root@server ]# ldapmodify -Y external -H ldapi:/// -f initial.ldif
We've also got to pull in a few other different configuration files, but we can do it in a one-liner here with a for loop:

[root@server ]# for i in cosine nis inetorgperson; do ldapadd -Y external -H ldapi:/// -f  /etc/openldap/schema/$i.ldif; done
Now we can add the OUs:

[root@server ]# ldapadd -x -W -D "cn=ldapadm, dc=la,dc=local" -f ous.ldif
We'll be prompted for a password, which is going to be the one we set earlier with slappasswd -h {SSHA} -s password.

Now, to add users, run this:

[root@server ]# ldapadd -x -W -D "cn=ldapadm, dc=la,dc=local" -f users.ldif
We'll need our password again, and then we should see users get added.
```
# Make sure PAM authentication is correct 
```
We need to set up PAM to authenticate users correctly. On the server, we can run the following command to do the configuration for you:

[root@server ]# authconfig --enableldap --enableldapauth --ldapserver=localhost --ldapbasedn="dc=la,dc=local" --enablemkhomedir --update
Then we've got to restart the daemon, so that our changes take effect:

[root@server ]# systemctl restart nslcd
Now let's test. Run id tcox, and we should see details on the tcox user. tcox, by the way, was one of the users we set up. You might have seen the username in output from one of the ldapadd commands. Run id pinehead to see if that user was added too.

Now, we can become tcox by running su - tcox. We should end up being that user, and sitting in the home directory (we'll also notice that the directory is created upon the su command getting run too), /home/tcox.

```
# On the client 
```
It doesn't matter if we're doing this next bit on the client or the server, since both ways will be actually authenticating to the same LDAP server.

Let's set a new pinehead password:

[root@client ]# ldappasswd -s password -W -D "cn=ldapadm, dc=la,dc=local" -x "uid=pinehead,ou=People,dc=la,dc=local"
Enter a new password at the prompt, then try logging in as pinehead:

[root@client ]# ssh pinehead@localhost
After an authenticity prompt, we should see a Creating '/home/pinehead' message and we're in as pinehead, sitting in this account's home directory.

```

