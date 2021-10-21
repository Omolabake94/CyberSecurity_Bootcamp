## Web Application 1: Your Wish is My Command Injection
* Using the dot-dot-slash method to design two payloads that will display the contents
* Screenshot confirming the exploit was successfully executed on /etc/passwd
* ![alt_text](HW_15/image2.png)
* Screenshot confirming the exploit was successfully executed on /etc/hosts
* `8.8.8.8 && cat ../../../../../etc/hosts`
* ![alt_text](HW_15/image3.png)

### Mitigation strategies
1. Set up input validation to prevent attacks like XSS and SQL Injection
2. Create a white list of possible inputs, to ensure the system accepts only pre-approved inputs
3. Avoid system calls and user input—to prevent threat actors from inserting characters into the OS command.

## Web Application 2: A Brute Force to Be Reckoned With
* ![alt_text](HW_15/image4.png)
* ![alt_text](HW_15/image5.png)
* ![alt_text](HW_15/image6.png)
* ![alt_text](HW_15/image7.png)
* ![alt_text](HW_15/image8.png)

### Mitigation strategies
1. Limitation of login attempts
2. Use of Two-Factor Authentication 
3. Use Strong Passwords
## Web Application 3: Where's the BeEF
* ![alt_text](HW_15/image10.png)
* ![alt_text](HW_15/image11.png)
Social Engineering >> Pretty Theft
* ![alt_text](HW_15/image12.png)
* ![alt_text](HW_15/image13.png)
* ![alt_text](HW_15/image14.png)
Social Engineering >> Fake Notification Bar
* ![alt_text](HW_15/image15.png)
* ![alt_text](HW_15/image16.png)
* ![alt_text](HW_15/image17.png)
Host >> Get Geolocation (Third Party)
* ![alt_text](HW_15/image18.png)
* ![alt_text](HW_15/image19.png)

### Mitigation strategie
