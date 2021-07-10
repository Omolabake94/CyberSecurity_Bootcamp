### cd  Step 3: Correlating the Evidence

grep command isolate all of the losses that occurred on March 10, 12, and 15.
* grep -$* * > Roulette_Losses

* grep -i 0310* Roulette_Losses | wc -l > Note_Player_Analysis
* grep -i 0312* Roulette_Losses | wc -l >> Note_Player_Analysis
* grep -i 0315* Roulette_Losses | wc -l >> Note_Player_Analysis
* grep -i 'mylie Schmidt' Roulette_Losses | wc -l >> Note_Player_Analysis

Shell for each day
* #!/bin/bash
* cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
* grep -i '0310_win_loss_player_data:05:00:00 AM' Roulette_Losses
* cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '05:00:00 AM'