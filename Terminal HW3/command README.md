### cd  Step 3: Correlating the Evidence

grep command isolate all of the losses that occurred on March 10, 12, and 15.
* grep -$* * > Roulette_Losses

* grep -i 0310* Roulette_Losses | wc -l > Note_Player_Analysis
* grep -i 0312* Roulette_Losses | wc -l >> Note_Player_Analysis
* grep -i 0315* Roulette_Losses | wc -l >> Note_Player_Analysis
* grep -i 'mylie Schmidt' Roulette_Losses | wc -l >> Note_Player_Analysis

Shell for each day
 #!/bin/bash
 cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
 grep -i '0310_win_loss_player_data:05:00:00 AM' Roulette_Losses
 cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
 awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '05:00:00 AM'
./find_player_dealer.sh
0310_win_loss_player_data:05:00:00 AM	-$82,348	Amirah Schneider,Nola Portillo, Mylie Schmidt,Suhayb Maguire,Millicent Betts,Avi Graves
05:00:00 AM Billy Jones

#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0310_win_loss_player_data:08:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '08:00:00 AM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0310_win_loss_player_data:02:00:00 PM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '02:00:00 PM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0310_win_loss_player_data:08:00:00 PM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '80:00:00 PM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0310_win_loss_player_data:11:00:00 PM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '11:00:00 PM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0312_win_loss_player_data:05:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '05:00:00 AM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0312_win_loss_player_data:08:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '08:00:00 AM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0312_win_loss_player_data:02:00:00 PM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '02:00:00 PM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0312_win_loss_player_data:08:00:00 PM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '08:00:00 PM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0312_win_loss_player_data:11:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '11:00:00 PM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0315_win_loss_player_data:05:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '05:00:00 AM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0315_win_loss_player_data:08:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '08:00:00 AM'
 
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0315_win_loss_player_data:02:00:00 PM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '02:00:00 PM'
 
