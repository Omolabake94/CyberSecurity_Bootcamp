# Protecting VSI from Future Attacks
## Part 1: Windows Server Attack

### Question 1
Several users were impacted during the attack on March 25th but based on the attack signatures User K, User A, User J were mostly affected. From the screen short below. These are signs of Brute force attack.
image01 and image1
#### Global Mitigations for VSI
1. Use Strong Passwords. Strong password policies should be put in place; ensure users are not allowed to use their names as passwords and passwords should not less that 8 characters which should include numbers and special characters
2. Restrict Access to Authentication URLs
3. Limit Login Attempts 
4. Use of CAPTCHAs on website
5. Use of Two-Factor Authentication to verify user before login and multi-factor authentication to verify user identity before allowing password changes
6. Putting your website behind a web application firewall
7. Increase lockout time after every lockout and after 2 lockouts their accounts would have to be manually unlocked by the IT Department

### User K
There were several attempts made to reset User k accounts password. The total of 2012 attempts were made. As shown in the screenshot below
image5
##### Mitigation
It is highly recommended that all global mitigations be employed on all users but specifically for User K, multi-factor authentication to verify user identity before allowing password changes should be employed

### User A
Several login attempts were made on User A's account which lead to being locked out several times. Account was locked out 1694 times as shown in the screen shot below
image6
##### Mitigation
It is highly recommended that all global mitigations be employed on all users but specifically for User A, Increase lockout time after every lockout and after 2 lockouts the account has to be manually unlocked by the IT Department

### User J
Several successful logins occurred on User J's account. This is a sign that the Bruteforce was successful. 
