## Week 7 Homework: A Day in the Life of a Windows Sysadmin
### Task 1: Create a GPO: Disable Local Link Multicast Name Resolution (LLMNR)
* Create a Group Policy Object that prevents your domain-joined Windows machine from using LLMNR
* Screenshots of all the GPOs created:

![alt text](proof_of_work.md/image1.png)

* link the GPO to the GC Computers organizational unit:

![alt text](proof_of_work.md/image2.png)

### Task 2: Create a GPO: Account Lockout
* Create a reasonable account lockout Group Policy for the Windows 10 machine:
![alt text](proof_of_work.md/image3.png)


* link the GPO to your GC Computers organizational unit:
![alt text](proof_of_work.md/image4.png)


### Task 3: Create a GPO: Enabling Verbose PowerShell Logging and Transcription
* Create a Group Policy Object to enable PowerShell logging and transcription:
![alt text](proof_of_work.md/image5.png)

* Link this new PowerShell Logging GPO to the GC Computers OU:
![alt text](proof_of_work.md/image6.png)

### Task 4: Create a Script: Enumerate Access Control Lists
* Create a foreach loop. You can use the following template:
![alt text](proof_of_work.md/image7.png)

* Save this script in C:\Users\sysadmin\Documents as enum_acls.ps1
![alt text](proof_of_work.md/image8.png)

* Run the enum_acls.ps1 script using the full file path and name
![alt text](proof_of_work.md/image9.png)

* You should see the ACL output of each file or subdirectory where you ran the script from
![alt text](proof_of_work.md/image10.png)

### Bonus Task 5: Verify Your PowerShell Logging GPO
* Check the C:\Users\sysadmin\Documents for your new logs
![alt text](proof_of_work.md/image11.png)

* New transcribed PowerShell logs:
![alt text](proof_of_work.md/image12.png)