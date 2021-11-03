# Homework: Lets go Splunking
## Step 1: The Need for Speed
1. Upload file of the system speeds around the time of the attack; server_speedtest.csv
- image1
2. Query to show the ratio between the upload and download speeds
- Query- `source="server_speedtest.csv" | eval ratio = UPLOAD_MEGABITS / DOWNLOAD_MEGABITS`
- image2
3. Query to create a report that displays the following fields in a statistics report: _time, IP_ADDRESS, DOWNLOAD_MEGABITS, UPLOAD_MEGABITS, ratio
- Query- `source="server_speedtest.csv" | table _time,IP_ADDRESS,DOWNLOAD_MEGABITS,UPLOAD_MEGABITS | eval ratio = DOWNLOAD_MEGABITS / UPLOAD_MEGABITS`
- image3
4. As highlighted in the picture above, the approximate date and time of the attack is 02/23/2020 at 2:30pm (14:30:00)
- the system fully recover around 11:30 pm (23:30:00) on 02/23/2020, Took the system about 9 hours to recover.
