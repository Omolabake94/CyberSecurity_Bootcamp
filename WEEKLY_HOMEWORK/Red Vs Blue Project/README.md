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
- 
