The usermod command will change which group a user is in. Change tstark:

usermod -g wheel tstark
Make sure it worked:

id tstark
The command's output should show his primary group is now wheel.

Add superhero as a Supplementary Group on All Three Users
Run the usermod command for each user:

usermod -aG superhero tstark
usermod -aG superhero dprince
usermod -aG superhero cdanvers
Check with any of the users to make sure it worked:

id <USERNAME>
We should see they're now in superhero, as well as their own groups.

Lock the dprince Account
Run the following:

usermod -L dprince
