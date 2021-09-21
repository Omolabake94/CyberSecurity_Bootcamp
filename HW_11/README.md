# Part 1:
## Security Control Types
The concept of defense in depth can be broken down into three different security control types. Identify the security control type of each set  of defense tactics.
1) Walls, bollards, fences, guard dogs, cameras, and lighting are what type of security control?
Answer: Preventive control
2) Security awareness programs, BYOD policies, and ethical hiring practices are what type of security control?
Answer: Administrative control
3) Encryption, biometric fingerprint readers, firewalls, endpoint security, and intrusion detection systems are what type of security control?
Answer: Technical control

## Intrusion Detection and Attack indicators
1) What's the difference between an IDS and an IPS?
Answer: Intrution Detection Systems analyze and monitor network traffic for signatures that match known cyberattacks, these tools do not take action on there own while Intrution Prevention system analyze, monitor. accepts or rejects network traffic based on ruleset. These tools can take action on their own.
2) What's the difference between an Indicator of Attack and an Indicator of Compromise?
Answer: Indicator of attack shows that an attack is ongoing on a system while indicator of compromise shows the details after an attack has been done. The information acquired can be used to mitigate future possible threats

## The Cyber Kill Chain
Name each of the seven stages for the Cyber Kill chain and provide a brief example of each.
* Stage 1:


* Stage 2:


* Stage 3:


* Stage 4:


* Stage 5:


* Stage 6:


* Stage 7:

## Snort Rule Analysis
Use the Snort rule to answer the following questions:
#### Snort Rule #1
```
alert tcp $EXTERNAL_NET any -> $HOME_NET 5800:5820 (msg:"ET SCAN Potential VNC Scan 5800-5820"; flags:S,12; threshold: type both, track by_src, count 5, seconds 60; reference:url,doc.emergingthreats.net/2002910; classtype:attempted-recon; sid:2002910; rev:5; metadata:created_at 2010_07_30, updated_at 2010_07_30;)
```
Break down the Sort Rule header and explain what is happening.
Answer:


What stage of the Cyber Kill Chain does this alert violate?
Answer:


What kind of attack is indicated?
Answer:

#### Snort Rule #2
```
alert tcp $EXTERNAL_NET $HTTP_PORTS -> $HOME_NET any (msg:"ET POLICY PE EXE or DLL Windows file download HTTP"; flow:established,to_client; flowbits:isnotset,ET.http.binary; flowbits:isnotset,ET.INFO.WindowsUpdate; file_data; content:"MZ"; within:2; byte_jump:4,58,relative,little; content:"PE|00 00|"; distance:-64; within:4; flowbits:set,ET.http.binary; metadata: former_category POLICY; reference:url,doc.emergingthreats.net/bin/view/Main/2018959; classtype:policy-violation; sid:2018959; rev:4; metadata:created_at 2014_08_19, updated_at 2017_02_01;)
```
Break down the Sort Rule header and explain what is happening.
Answer:


What layer of the Defense in Depth model does this alert violate?
Answer:


What kind of attack is indicated?
Answer:


Snort Rule #3


Your turn! Write a Snort rule that alerts when traffic is detected inbound on port 4444 to the local network on any port. Be sure to include the msg in the Rule Option.
Answer:
