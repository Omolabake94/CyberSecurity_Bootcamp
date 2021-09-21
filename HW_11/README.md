# Part 1:
## Security Control Types
The concept of defense in depth can be broken down into three different security control types. Identify the security control type of each set  of defense tactics.
1) Walls, bollards, fences, guard dogs, cameras, and lighting are what type of security control?
* Answer: Physical control
2) Security awareness programs, BYOD policies, and ethical hiring practices are what type of security control?
* Answer: Administrative control
3) Encryption, biometric fingerprint readers, firewalls, endpoint security, and intrusion detection systems are what type of security control?
* Answer: Technical control

## Intrusion Detection and Attack indicators
1) What's the difference between an IDS and an IPS?
* Answer: `Intrution Detection Systems` analyze and monitor network traffic for signatures that match known cyberattacks, these tools do not take action on there own while `Intrution Prevention system` analyze, monitor. accepts or rejects network traffic based on ruleset. These tools can take action on their own.
2) What's the difference between an Indicator of Attack and an Indicator of Compromise?
* Answer: `Indicator of Attack` shows that an attack is ongoing on a system. it detects the intent of what an attacker is trying to accomplish  while `Indicator of Compromise` indicates that the security of the network has been breached. It shows the details after an attack has been done. The information acquired can be used to mitigate future possible threats

## The Cyber Kill Chain
Name each of the seven stages for the Cyber Kill chain and provide a brief example of each.
* Stage 1-RECONNAISSANCE: This is the step an attacker selects a target, depending on the motive(s) of the attacker and also gathering as much infomation as possible on an individual or organization in preparation for the attack
* Stage 2-WEAPONIZATION: attackers will re-engineer some core malware to suit their purposes using sophisticated techniques. This process often involves embedding specially crafted malware into an otherwise benign or legitimate document, such as a press release or contract document, or hosting the malware on a compromised domain
* Stage 3-DELIVERY: Attackers will then determine which methods to use in order to deliver malicious payloads. Some of the methods they might utilize are automated tools, such as exploit kits, spear phishing attacks with malicious links, or attachments and malvertizing
* Stage 4-EXPLOITATION: At this stage, attackers deploy an exploit against a vulnerable application or system so a to gaining remote access and compromise the user's machine
* Stage 5-INSTALLATION: Once attackers have established an initial foothold, they will install malware in order to conduct further operations, such as maintaining access, persistence and escalating privileges
* Stage 6-COMMAND AND CONTROL: Attackers will establish a command channel in order to communicate and pass data back and forth between the infected devices and their own infrastructure. They can now actively control the system, instructing the next stages of attack.
* Stage 7-Actions on the Objective: Now that the adversaries have control, persistence and ongoing communication, they will act upon their motivations in order to achieve their goal. This could be data exfiltration, destruction of critical infrastructure, to deface web property, or to create fear or the means for extortion.

## Snort Rule Analysis
Use the Snort rule to answer the following questions:
#### Snort Rule #1
```
alert tcp $EXTERNAL_NET any -> $HOME_NET 5800:5820 (msg:"ET SCAN Potential VNC Scan 5800-5820"; flags:S,12; threshold: type both, track by_src, count 5, seconds 60; reference:url,doc.emergingthreats.net/2002910; classtype:attempted-recon; sid:2002910; rev:5; metadata:created_at 2010_07_30, updated_at 2010_07_30;)
```
1) Break down the Sort Rule header and explain what is happening.
* Answer: This type of response is an alert, the protocol is tcp. traffic coming from external network from any port going to home network on port 5800-5820
2) What stage of the Cyber Kill Chain does this alert violate?
* Answer: Reconnaissance
3) What kind of attack is indicated?
* Answer: Potential VNC Scan

#### Snort Rule #2
```
alert tcp $EXTERNAL_NET $HTTP_PORTS -> $HOME_NET any (msg:"ET POLICY PE EXE or DLL Windows file download HTTP"; flow:established,to_client; flowbits:isnotset,ET.http.binary; flowbits:isnotset,ET.INFO.WindowsUpdate; file_data; content:"MZ"; within:2; byte_jump:4,58,relative,little; content:"PE|00 00|"; distance:-64; within:4; flowbits:set,ET.http.binary; metadata: former_category POLICY; reference:url,doc.emergingthreats.net/bin/view/Main/2018959; classtype:policy-violation; sid:2018959; rev:4; metadata:created_at 2014_08_19, updated_at 2017_02_01;)
```
1) Break down the Sort Rule header and explain what is happening.
* Answer: This type of response is an alert, the protocol is tcp. traffic coming from external network from http port or port 80 going to home network on any port
2) What layer of the Defense in Depth model does this alert violate?
* Answer: Administrative: policy-violation
3) What kind of attack is indicated?
* Answer: PE EXE or DLL Windows file download HTTP

#### Snort Rule #3
Your turn! Write a Snort rule that alerts when traffic is detected inbound on port 4444 to the local network on any port. Be sure to include the msg in the Rule Option.
* Answer: `alert tcp $EXTERNAL_NET 4444 -> $HOME_NET any (msg:"ET Possible Trojan, Prosiak, Oracle or Crackdown")`

# Part 2: "Drop Zone" Lab
## Uninstall ufw
Before getting started, you should verify that you do not have any instances of ufw running. This will avoid conflicts with your firewalld service. This also ensures that firewalld will be your default firewall.
* Run the command that removes any running instance of ufw.
* `$ sudo apt -y remove ufw`
## Enable and start firewalld
By default, these service should be running. If not, then run the following commands:
Run the commands that enable and start firewalld upon boots and reboots.
* `$ sudo systemctl enable firewalld`
* `$ sudo systemctl start firewalld`
- Note: This will ensure that firewalld remains active after each reboot.
## Confirm that the service is running.
Run the command that checks whether or not the firewalld service is up and running.
* `$ sudo firewall-cmd --state`
## List all firewall rules currently configured.
Next, lists all currently configured firewall rules. This will give you a good idea of what's currently configured and save you time in the long run by not doing double work.
* Run the command that lists all currently configured firewall rules:
* `$ sudo firewall-cmd --list-all`
- Take note of what Zones and settings are configured. You many need to remove unneeded services and settings.
## List all supported service types that can be enabled.
Run the command that lists all currently supported services to see if the service you need is available
* `$ sudo firewalld-cmd --get-services`
- We can see that the Home and Drop Zones are created by default.
## Zone Views
Run the command that lists all currently configured zones.
* `$ sudo firewall-cmd --list-all-zones`
- We can see that the Public and Drop Zones are created by default. Therefore, we will need to create Zones for Web, Sales, and Mail.
## Create Zones for Web, Sales and Mail.
Run the commands that creates Web, Sales and Mail zones.
* `$ sudo firewall-cmd --permanent --new-zone=web`
* `$ sudo firewall-cmd --permanent --new-zone=mail`
* `$ sudo firewall-cmd --permanent --new-zone=sales`
## Set the zones to their designated interfaces:
Run the commands that sets your eth interfaces to your zones.
* `$ sudo firewall-cmd --zone=public --change-interface=eth0`
* `$ sudo firewall-cmd --zone=web --change-interface=eth1`
* `$ sudo firewall-cmd --zone=sales --change-interface=eth2`
* `$ sudo firewall-cmd --zone=mail --change-interface=eth3`
## Add services to the active zones:
Run the commands that add services to the public zone, the web zone, the sales zone, and the mail zone.
- Public:
* `$ sudo firewall-cmd --permanent --zone=public --add-service=http`
* `$ sudo firewall-cmd --permanent --zone=public --add-service=https`
* `$ sudo firewall-cmd --permanent --zone=public --add-service=pop3`
* `$ sudo firewall-cmd --zone=public --add-service=smtp`
- Web:
* `$ sudo firewall-cmd --permanent --zone=web --add-service=http`
- Sales
* `$ sudo firewall-cmd --permanent --zone=sales --add-service=https`
- Mail
* `$ sudo firewall-cmd --permanent --zone=mail --add-service=pop3`
* `$ sudo firewall-cmd --permanent --zone=mail --add-service=smtp`
## What is the status of http, https, smtp and pop3?

## Add your adversaries to the Drop Zone.
Run the command that will add all current and any future blacklisted IPs to the Drop Zone.
- `$ sudo firewall-cmd --permanent --zone=drop --add-source=10.208.56.23`
- `$ sudo firewall-cmd --permanent --zone=drop --add-source=135.95.103.76`
- `$ sudo firewall-cmd --permanent --zone=drop --add-source=76.34.169.118`
- Make rules permanent then reload them:
- It's good practice to ensure that your firewalld installation remains nailed up and retains its services across reboots. This ensure that the network remains secured after unplanned outages such as power failures.
- Run the command that reloads the firewalld configurations and writes it to memory
- `$ sudo firewall-cmd --reload`
## View active Zones
Now, we'll want to provide truncated listings of all currently active zones. This a good time to verify your zone settings.
- Run the command that displays all zone services.
- `$ sudo firewall-cmd --get-active-zones` 
## Block an IP address
Use a rich-rule that blocks the IP address 138.138.0.3.
- `$ sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="138.138.0.3" reject'`
## Block Ping/ICMP Requests
Harden your network against ping scans by blocking icmp ehco replies.


Run the command that blocks pings and icmp requests in your public zone.
$ <ADD COMMAND HERE>



Rule Check
Now that you've set up your brand new firewalld installation, it's time to verify that all of the settings have taken effect.


Run the command that lists all  of the rule settings. Do one command at a time for each zone.
$ <ADD COMMAND HERE>
$ <ADD COMMAND HERE>
$ <ADD COMMAND HERE>
$ <ADD COMMAND HERE>
$ <ADD COMMAND HERE>


Are all of our rules in place? If not, then go back and make the necessary modifications before checking again.


Congratulations! You have successfully configured and deployed a fully comprehensive firewalld installation.
