# Protecting VSI from Future Attacks
## Part 1: Windows Server Attack

### Question 1
Several users were impacted during the attack on March 25th but based on the attack signatures User K, User A, User J were mostly affected. From the screen short below. These are signs of Brute force attack.
image01 and image1
#### Global Mitigations for VSI
1. Use Strong Passwords. Strong password policies should be put in place; ensure users are not allowed to use their names as passwords and passwords should not less that 8 characters which should include numbers and special characters
2. Restrict Access to Authentication URLs
3. Limit failed login Attempts 
4. Use of CAPTCHAs on website
5. It is highly recommended that all global mitigations be employed on all users but specifically for User
6. Use of Two-Factor Authentication to verify user before login and multi-factor authentication to verify user identity before allowing password changes
7. Putting your website behind a web application firewall
8. Increase lockout time after every lockout and after 3 lockouts their accounts would have to be manually unlocked by the IT Department

### User K
There were several attempts made to reset User k accounts password. The total of 2012 attempts were made. As shown in the screenshot below
image5
##### Mitigation
1. It is highly recommended that all global mitigations be employed on all users but specifically for User K;
2. Limit failed password reset Attempts 
3. Use of multi-factor authentication to verify user identity before allowing password changes

### User A
Several login attempts were made on User A's account which lead to being locked out several times. Account was locked out 1694 times as shown in the screen shot below
image6
##### Mitigation
1. It is highly recommended that all global mitigations be employed on all users but specifically for User A; 
2. Limit failed Login Attempts 
3. Increase lockout time after every lockout and after 3 lockouts the account has to be manually unlocked by the IT Department

### User J
Several successful logins occurred on User J's account. This is a sign that the Bruteforce was successful. There were 302 successful logins as show in the screenshot below
image7
##### Mitigation 
1. It is highly recommended that all global mitigations be employed on all users but specifically for User J, 
2. Use of CAPTCHAs on website 
3. Use of Two-Factor Authentication to verify user before login

### Question 2
* Mitigations to protect VSI from possible "Bad Logins" from JobeCorp
1. Allow a set number of "bad logins", once the threshold is met, alert should go off and notify necessary people before lockout
2. Rules should be put in place; after the threshold of allowable bad logins is reached by a particular IP, the serve should drop/block the IP from future connections
## Part 2: Apache Webserver Attack:
### Question 1
1. Based on the geographic map, the recommended firewall rule is;
* `Block all incoming HTTP traffic from Ukraine`
2. Screenshots of the geographic map that justified the rule created
image2
image3
image4
image8

### Question 2
* Other rules to protect VSI from attacks against the webserver
1. Block multiple GET and POST requests from the same IP Address within the space of 30 secs
2. Whitelist all IPs within VSI network and blacklist any IP coming from other locations
