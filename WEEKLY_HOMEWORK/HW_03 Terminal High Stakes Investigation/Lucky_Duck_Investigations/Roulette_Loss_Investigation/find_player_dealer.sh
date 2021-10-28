#!/bin/bash
cd Player_Analysis
grep -i '0310_win_loss_player_data:05:00:00 AM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '05:00:00 AM'
cd ..
cd Player_Analysis
grep -i '0310_win_loss_player_data:08:00:00 AM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '08:00:00 AM'
cd ..
cd Player_Analysis
grep -i '0310_win_loss_player_data:02:00:00 PM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '02:00:00 PM' 
cd ..
cd Player_Analysis
grep -i '0310_win_loss_player_data:08:00:00 PM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '08:00:00 PM'
cd ..
cd Player_Analysis
grep -i '0310_win_loss_player_data:11:00:00 PM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '11:00:00 PM'
cd ..
cd Player_Analysis
grep -i '0312_win_loss_player_data:05:00:00 AM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '05:00:00 AM'
cd ..
cd Player_Analysis
grep -i '0312_win_loss_player_data:08:00:00 AM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '08:00:00 AM'
cd ..
cd Player_Analysis
grep -i '0312_win_loss_player_data:02:00:00 PM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '02:00:00 PM'
cd ..
cd Player_Analysis
grep -i '0312_win_loss_player_data:08:00:00 PM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '08:00:00 PM'
cd ..
cd Player_Analysis
grep -i '0312_win_loss_player_data:11:00:00 PM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '11:00:00 PM'
cd ..
cd Player_Analysis
grep -i '0315_win_loss_player_data:05:00:00 AM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '05:00:00 AM'
cd ..
cd Player_Analysis
grep -i '0315_win_loss_player_data:08:00:00 AM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '08:00:00 AM'
cd ..
cd Player_Analysis
grep -i '0315_win_loss_player_data:02:00:00 PM' Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '02:00:00 PM'

