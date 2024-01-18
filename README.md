# Set OLDPWD On Logout

---

### Introduction

Problem:

Say, you've been working from deep within a specific directory, while ssh'd into a Linux server. Then suddenly, your ssh client logs you out, and you log back in, and are presented back to ~/ i.e. home. 

You remember, there's a cool trick with the change directory command, cd, where you do the following:

     cd - 
     
This will change the directory to a variable set as OLDPWD. Unfortunately, when the server logs out, after the ssh connection is severed, the OLDPWD environment variable is set to NULL. 

---

### Solution for Bash

There are two files (among others) used by bash, when setting up the terminal. The ones were interested in are:

     .bash_logout 
    
     .bash_profile 
    
We simply redirect the current path (pwd) to a file, in the home directory, called:

     .oldpwd
     
This step is done when we log out, so we'll add it to .bash_logout. We then simply set the OLDPWD variable on login to the path saved in .oldpwd. This is done in the .bash_profile file. 

---

### Bash Shell Script

I've put together a bash shell script which handles the above changes, but also checks if the files above have the lines which accomplish the steps listed above. 

NOTE: In order to execute the shell script, you will need to run the following command:

     chmod +x SetOldPwdOnLogout.sh 
     
Then simply execute and monitor the output with:

     ./SetOldPwdOnLogout.sh

---

### Conclusion

From here, after successfully running the shell script, when logged out from the ssh client, and upon logging back in, you can simply do:

     cd -
    
And then you will be redirected to the last directory you were in, before you logged out, or were disconnected by your ssh client.

---
---