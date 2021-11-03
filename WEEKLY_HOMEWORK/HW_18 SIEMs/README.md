# Homework: Lets go Splunking
1. Upload file of the system speeds around the time of the attack; server_speedtest.csv
- image1
2. Command to show the ratio between the upload and download speeds
- command
- image
3. Command to create a report that displays the following fields in a statistics report: _time, IP_ADDRESS, DOWNLOAD_MEGABITS, UPLOAD_MEGABITS, ratio
- `source="server_speedtest.csv" | table _time,IP_ADDRESS,DOWNLOAD_MEGABITS,UPLOAD_MEGABITS | eval ratio = DOWNLOAD_MEGABITS / UPLOAD_MEGABITS`
-
4. 
