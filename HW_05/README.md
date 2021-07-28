## Step 1: Create, Extract, Compress, and Manage tar Backup Archives

1. Command to extract the TarDocs.tar archive to the current directory
* `tar -xvvf TarDocs.tar`
2. Command to create the Javaless_Doc.tar archive from the TarDocs/ directory, while excluding the TarDocs/Documents/Java directory:
* `tar -cvvWf Javaless_Docs.tar --exclude="Java" TarDocs`
3. Command to ensure Java/ is not in the new Javaless_Docs.tar archive:
* `tar tvvf Javaless_Docs.tar | grep Java`
#### Bonus 
* Command to create an incremental archive called logs_backup_tar.gz with only changed files to snapshot.file for the /var/log directory
* `tar -cvvWf logs_backup.tar --listed-incremental=logs_backup.snar /var/logs/`
* `gzip logs_backup.tar
#### Critical Analysis Question
* Why wouldn't you use the options -x and -c at the same time with tar?
* -x is to extract a tar and -c is to create a tar. Tar command cannot create and export a tar at the same time

## Step 2: Create, Manage, and Automate Cron Jobs
1. Cron job for backing up the /var/log/auth.log file: 
* `0 6 * * 3 tar zcvvf /auth_backup.tar.gz /var/log/auth.log >/dev/null 2>&1`

## Step 3: Write Basic Bash Scripts
1. Brace expansion command to create the four subdirectories:
* `mkdir ~/backups/{freemem,diskuse,openlist,freedisk}`
2. Paste your system.sh script edits below:
* `free -h > ~/backups/freemem/free_mem.txt`
* `du -h > ~/backups/diskuse/disk_usage.txt`
* `lsof > ~/backups/openlist/open_list.txt`
* `df -h > ~/backups/freedisk/free_disk.txt`

3. Command to make the system.sh script executable:
* `sudo chmod +x system.sh`

#### Optional
* Commands to test the script and confirm its execution:
* `cat ~/backups/freemem/free_mem.txt`
* `cat ~/backups/diskuse/disk_usage.txt`
* `cat ~/backups/openlist/open_list.txt`
* `cat ~/backups/freedisk/free_disk.txt`
#### Bonus
* Command to copy system to system-wide cron directory:
* `cp ~/system.sh /etc/cron.weekly`

## Step 4. Manage Log File Sizes
* Config file edits below:
`/var/log/auth.log {
    weekly
    rotate 7
    notifempty
    delaycompress
    missingok
    endscript
}`

### Bonus: Check for Policy and File Violations
1. Command to verify auditd is active:
* `sudo systemctl status auditd`
2. Command to set number of retained logs and maximum log file size:
* Edits made to the configuration file below:
* `max_log_file = 35`
* `num_logs = 7`
3. Command using auditd to set rules for /etc/shadow, /etc/passwd and /var/log/auth.log:
* Edits made to the rules file below:
* `-w /etc/passwd -p wra -k userpass_audit`
* `-w /etc/shadow -p wra -k hashpass_audit`
* `-w /var/log/auth.log -p wra -k authlog_audit`
4. Command to restart auditd:
* `sudo systemctl restart auditd`
5. Command to list all auditd rules:
* `sudo auditctl -l`
6. Command to produce an audit report:
* `sudo aureport -au`
7. Create a user with sudo useradd attacker and produce an audit report that lists account modifications:
* `sudo aureport -m`
* Account Modifications Report
=================================================
###### date time auid addr term exe acct success event
=================================================
* 1. 07/23/2021 06:30:53 -1 ? ? /usr/sbin/useradd vboxadd no 242
* 2. 07/23/2021 06:30:53 -1 ? ? /usr/sbin/useradd vboxadd no 243
* 3. 07/23/2021 06:30:53 -1 ? ? /usr/sbin/useradd vboxadd no 244
* 4. 07/23/2021 06:30:53 -1 ? ? /usr/sbin/useradd vboxadd no 245
* 5. 07/23/2021 19:25:52 -1 ? ? /usr/sbin/useradd vboxadd no 238
* 6. 07/23/2021 19:25:52 -1 ? ? /usr/sbin/useradd vboxadd no 239
* 7. 07/23/2021 19:25:52 -1 ? ? /usr/sbin/useradd vboxadd no 240
* 8. 07/23/2021 19:25:52 -1 ? ? /usr/sbin/useradd vboxadd no 241
* 9. 07/23/2021 19:32:49 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 359
* 10. 07/23/2021 19:32:49 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 360
* 11. 07/23/2021 19:32:49 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 361
* 12. 07/23/2021 19:32:49 1000 UbuntuDesktop pts/0 /usr/sbin/useradd ? yes 362
* 13. 07/23/2021 19:32:56 1000 UbuntuDesktop pts/0 /usr/bin/passwd acker yes 364
* 14. 07/23/2021 19:34:56 1000 UbuntuDesktop pts/0 /usr/sbin/usermod acker yes 384
* 15. 07/23/2021 19:34:56 1000 UbuntuDesktop pts/0 /usr/sbin/usermod acker yes 385
* 16. 07/23/2021 19:46:00 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 465
* 17. 07/23/2021 19:46:00 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 466
* 18. 07/23/2021 19:46:00 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 467
* 19. 07/23/2021 19:46:00 1000 UbuntuDesktop pts/0 /usr/sbin/useradd ? yes 468
* 20. 07/23/2021 19:46:05 1000 UbuntuDesktop pts/0 /usr/bin/passwd badgu yes 482
* 21. 07/23/2021 23:09:16 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 2463
* 22. 07/23/2021 23:09:16 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 2465
* 23. 07/23/2021 23:09:16 1000 UbuntuDesktop pts/0 /usr/sbin/groupadd ? yes 2466
* 24. 07/23/2021 23:09:16 1000 UbuntuDesktop pts/0 /usr/sbin/useradd ? yes 2473
* 25. 07/23/2021 23:09:19 1000 UbuntuDesktop pts/0 /usr/bin/passwd criminal no 2485
* 26. 07/24/2021 04:12:29 1000 UbuntuDesktop pts/1 /usr/sbin/useradd attacker yes 67296
* 27. 07/24/2021 04:12:29 1000 UbuntuDesktop pts/1 /usr/sbin/useradd ? yes 67300


8. Command to use auditd to watch /var/log/cron:
* `sudo auditctl -w /var/log/cron`
9. Command to verify auditd rules:
* `sudo auditctl -l`

### Bonus (Research Activity): Perform Various Log Filtering Techniques
1. Command to return journalctl messages with priorities from emergency to error:
* `journalctl -p 0..3`

2. Command to check the disk usage of the system journal unit since the most recent boot:
* `journalctl --disk-usage`

3. Comand to remove all archived journal files except the most recent two: 
* `sudo journalctl --vacuum-files=2`

4. Command to filter all log messages with priority levels between zero and two, and save output to /home/sysadmin/Priority_High.txt:
* `journalctl -p 0..2 > /home/sysadmin/Priority_High.txt`

5. Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below:
* `0 22 * * * sudo journalctl -p 0..2 > /home/sysadmin/Priority_High.txt >/dev/null 2>&1`
