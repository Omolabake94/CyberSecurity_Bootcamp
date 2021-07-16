#!/bin/bash
cd Player_Analysis
grep -i $1_win_loss_player_data:"$2" Roulette_Losses
cd ..
cd Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' $1_Dealer_schedule | grep -i "$3"

