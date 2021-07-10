### cd  Step 3: Correlating the Evidence
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0310_win_loss_player_data:05:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '05:00:00 AM'
