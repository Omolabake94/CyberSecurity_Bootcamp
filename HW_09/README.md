# Networks Fundamentals II Homework: In a Network Far, Far Away!
## Mission 1
* Command to determine the mail servers for starwars.com: `nslookup -type=mx starwars.com`

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
* Command to determine the SPF for theforce.net `nslookup -type=txt theforce.net`

* The Force's emails are going to spam because the new ip address has not been updated on the DNS record
* Corrected DNS record should be
```
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
theforce.net	text = "v=spf1 a mx mx:smtp.secureserver.net include:aspmx.googlemail.com ip4:104.156.250.80 ip4:45.63.15.159 ip4:45.63.4.215 ip4:45.23.176.21"
theforce.net	text = "google-site-verification=XTU_We07Cux-6WCSOItl0c_WS29hzo92jPE341ckbOQ"
theforce.net	text = "google-site-verification=ycgY7mtk2oUZMagcffhFL_Qaf8Lc9tMRkZZSuig0d6w"

Authoritative answers can be found from:
```
