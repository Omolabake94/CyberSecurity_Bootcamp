# Networking Fundamentals Homework: Rocking your Network
## Phase 1
* To determine IP address for the Hollywood office run:
* Install gnumeric to convert the .xlsx file
- `sudo apt install gnumeric -y`
![alt text](week_8_proof_of_work/image1.png)
* Then run 
- `ssconvert Rockstarserverlist.xlsx Rockstarserverlist.csv`
![alt text](week_8_proof_of_work/image2.png)
- Summary file that lists out the fping command used as well as a summary of the results.
- [Summary File](https://github.com/Omolabake94/CyberSecurity_Bootcamp_HW/blob/main/HW_08/summary_file.txt)
![alt text](week_8_proof_of_work/image3.png)
### Summary of findings
- IP 167.172.144.11 is alive and responding. this is a vulnerability because RockStar Corp doesn't want to respond to any requests
- It's recommended to use ICMP echo requests against IP 167.172.144.11 to prevent response from pings
- Findings were found at Network layer because IP addresses are used on Network layer

## Phase 2
- Command to run SYN SCAN
- `sudo nmap -sS 167.172.144.11`
- Determine which ports are accepting connections: 22/tcp   open   ssh 
![alt text](week_8_proof_of_work/image5.png)
### Summary of findings
- All ports are supposed to be closed but ssh port is open which is a vulnerability
- Recommendations includes changing ssh port number which will help stare hacker in a wrong direction. Root login should be disabled. Use of TCP Wrappers offer a host-based ACL protection that will allow sort out and filter who is able to access the SSH server. Disable empty passwords access
- OSI Layer is Transport. this is a transmission of data between source port and destination port

## Phase 3
- Command to access the server that is accepting connections
- `ssh jimi@167.172.144.11`
![alt text](week_8_proof_of_work/image6.png)
- Command to determine if something was modified on the system
- `cat /etc/hosts` = 98.137.246.8 rollingstone.com
![alt text](week_8_proof_of_work/image7.png)
![alt text](week_8_proof_of_work/image8.png)
- To find the domain associated to the IP address found
- `nslookup 98.137.246.8` = 8.246.137.98.in-addr.arpa	name = unknown.yahoo.com.
![alt text](week_8_proof_of_work/image9.png)
### Summary 
- 98.137.246.8 rollingstone.com, this modification was found in the /etc/hosts file of the IP address accepting connection. Rollingstone.com site is being routed to another IP address. This is a vulnerability.
- It's recommended to use antivirus/antimalware that has hosts protection icluded and also make hosts file permission read only 
- OSI layer is Presentation Layer because rollingstone site is translating the wrong data

## Phase 4
- Captured packet link
![alt text](week_8_proof_of_work/image10.png)

### ARP
- To filter ARP
- `arp.opcode == 2`
![alt text](week_8_proof_of_work/image12.png)
### Sumamary
- [Duplicate IP address detected for 192.168.47.200 (00:0c:29:1d:b3:b1) - also in use by 00:0c:29:0f:71:a3 (frame 4)]. This is a vulnerability and an indicator of an ARP poisoning attack
- It is recommended to use Static ARP table to statically map all the MAC addresses in a network to their rightful IP addresses
- OSI layer is Data Link because data might not be linking to the right IP adddress

### HTTP
- To filter HTTP
- `http.request.method == "POST"`
![alt text](week_8_proof_of_work/image11.png)
### Summary 
- Based on the message sent to Blue corp by the hacker. he is about to sell rockstarcorp.com's user name and password to Blues corp and also inform them about the vulnerable port available to get access
- Recommendations includes changing ssh port number which will help stare hacker in a wrong direction. Root login should be disabled. Use of TCP Wrappers offer a host-based ACL protection that will allow sort out and filter who is able to access the SSH server. Disable empty passwords access
- OSI layer is Application
