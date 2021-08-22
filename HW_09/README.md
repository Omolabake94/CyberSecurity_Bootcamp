# Networks Fundamentals II Homework: In a Network Far, Far Away!
## Mission 1
* Command to determine the mail servers for starwars.com: `nslookup -type=mx starwars.com`
![alt text](proof_of_work/image1.png)
* Resistance isn't receiving any emails because the DNS record has not been updated to the new mail servers
* Corrected DNS record should be:
```
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
starwars.com	mail exchanger = 10 aspmx3.googlemail.com.
starwars.com	mail exchanger = 10 aspmx2.googlemail.com.
starwars.com	mail exchanger = 5 alt2.aspmx.l.google.com.
starwars.com	mail exchanger = 5 asltx.2.google.com
starwars.com	mail exchanger = 1 asltx.l.google.com

Authoritative answers can be found from:
```

## Mission 2
* Command to determine the SPF for theforce.net: `nslookup -type=txt theforce.net`

* The Force's emails are going to spam because the new ip address has not been updated on the DNS record
* Corrected DNS record should be
```
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
theforce.net	text = "v=spf1 a mx mx:smtp.secureserver.net include:aspmx.googlemail.com ip4:45.23.176.21 ip4:104.156.250.80 ip4:45.63.15.159 ip4:45.63.4.215"
theforce.net	text = "google-site-verification=XTU_We07Cux-6WCSOItl0c_WS29hzo92jPE341ckbOQ"
theforce.net	text = "google-site-verification=ycgY7mtk2oUZMagcffhFL_Qaf8Lc9tMRkZZSuig0d6w"

Authoritative answers can be found from:
```

## Mission 3
* Command to determine how a CNAME should look: `nslookup -type=cname www.theforce.net`

* The sub page of resistance.theforce.net isn't redirecting to theforce.net because the DNS record does not show the the CNAME is set to resistance.theforce.net
* Corrected DNS record should be
```
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
www.theforce.net	canonical name = resistance.theforce.net.

Authoritative answers can be found from:
```

## Mission 4
* Command to confirm the DNS records: `nslookup -type=ns princessleia.site`

* Document how you would fix the DNS record to prevent this issue from happening again.
```
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
princessleia.site	nameserver = ns25.domaincontrol.com.
princessleia.site	nameserver = ns26.domaincontrol.com.
princessleia.site	nameserver = ns2.galaxybackup.com.

Authoritative answers can be found from:
```
## Mission 5
* The OSPF shortest path from Batuu to Jedha, this path does not include planet N
* #### Batuu > D > G > O > R > Q > T > V > Jedha = 23 hops

## Mission 6
* Command to find out the Dark Side's secret wireless key: `aircrack-ng -w /usr/share/wordlists/rockyou.txt Darkside.pcap`

* Key to decrypt the wireless traffic: `dictionary:linksys`

* Host IP Addresses and MAC Addresses by looking at the decrypted ARP traffic.

* Host IP Addresses and MAC Addresses: 172.16.0.101 (00:13:ce:55:98:ef) and 172.16.0.1 (00:0f:66:e3:e4:01)


## Mission 7
* Command to view DNS record from Mission #4: `nslookup -type=txt princessleia.site`

* Resistance hidden message:

*
