# Lucky Duck Investigations
### Step 1: Investigation Preparation
1. mkdir Lucky_Duck_Investigations
2. cd Lucky_Duck_Investigations
* mkdir Roulette_Loss_Investigation
3. cd Roulette_Loss_Investigation
* mkdir Player_Analysis Dealer_Analysis Player_Dealer_Correlation
4. cd Player_Analysis
* touch Notes_Player_Analysis
* cd Dealer_Analysis
* touch Notes_Dealer_Analysis
* cd Player_Dealer_Correlation
* touch Notes_Player_Dealer_Correlation

![image1](img/image1.png)

### Step 2: Gathering Evidence
1. cd Lucky_Duck_Investigations 
* Run wget "https://tinyurl.com/3-HW-setup-evidence" && chmod +x ./3-HW-setup-evidence && ./3-HW-setup-evidence
2. mv 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
* mv 0310_win_loss_player_data  0312_win_loss_player_data  0315_win_loss_player_data /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis

### Step 3: Correlating the Evidence
#### Player Analysis
1. cd Player_Analysis
2. grep -i -$* *
3. grep command isolate all of the losses that occurred on March 10, 12, and 15.
* grep -i -$* * > Roulette_Losses

4. Loss count for each day
* grep -i 0310* Roulette_Losses | wc -l > Note_Player_Analysis = 5
* grep -i 0312* Roulette_Losses | wc -l >> Note_Player_Analysis = 5
* grep -i 0315* Roulette_Losses | wc -l >> Note_Player_Analysis = 3

nano Note_Player_Analysis
The times the losses occurred on each day:
* 0310_:05:00:00	AM
* 0310_:08:00:00	AM
* 0310_:02:00:00	PM
* 0310_:08:00:00	PM
* 0310_:11:00:00	PM
* 0312_:05:00:00	AM
* 0312_:08:00:00	AM
* 0312_:02:00:00	PM
* 0312_:08:00:00	PM
* 0312_:11:00:00	PM
* 0315_:05:00:00	AM
* 0315_:08:00:00	AM
* 0315_:02:00:00	PM

player that was playing during each of those times is Mylie Schmidt

* grep -i 'mylie Schmidt' Roulette_Losses | wc -l >> Note_Player_Analysis = 13

#### Complete the dealer analysis
1. cd Dealer_Analysis
2. cat 0310_Dealer_schedule  0312_Dealer_schedule  0315_Dealer_schedule

3. nano find_player_dealer.sh
Shell for each day

* #!/bin/bash
* cd Player_Analysis
* grep -i '0310_win_loss_player_data:05:00:00 AM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '05:00:00 AM'
* cd ..
* cd Player_Analysis
* grep -i '0310_win_loss_player_data:08:00:00 AM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '08:00:00 AM'
* cd ..
* cd Player_Analysis
* grep -i '0310_win_loss_player_data:02:00:00 PM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
<<<<<<< HEAD:HW_03/README.md
* awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '02:00:00 PM'
=======
* awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '02:00:00 PM' 
>>>>>>> 851338b987b16e5b4589e35914266791e387c411:Terminal HW3/README.md
* cd ..
* cd Player_Analysis
* grep -i '0310_win_loss_player_data:08:00:00 PM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '08:00:00 PM'
* cd ..
* cd Player_Analysis
* grep -i '0310_win_loss_player_data:11:00:00 PM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '11:00:00 PM'
* cd ..
* cd Player_Analysis
* grep -i '0312_win_loss_player_data:05:00:00 AM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '05:00:00 AM'
* cd ..
* cd Player_Analysis
* grep -i '0312_win_loss_player_data:08:00:00 AM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '08:00:00 AM'
* cd ..
<<<<<<< HEAD:HW_03/README.md
=======
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '08:00:00 AM'
* cd ..
>>>>>>> 851338b987b16e5b4589e35914266791e387c411:Terminal HW3/README.md
* cd Player_Analysis
* grep -i '0312_win_loss_player_data:02:00:00 PM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '02:00:00 PM'
* cd ..
* cd Player_Analysis
* grep -i '0312_win_loss_player_data:08:00:00 PM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '08:00:00 PM'
* cd ..
* cd Player_Analysis
* grep -i '0312_win_loss_player_data:11:00:00 PM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep -i '11:00:00 PM'
* cd ..
* cd Player_Analysis
* grep -i '0315_win_loss_player_data:05:00:00 AM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '05:00:00 AM'
* cd ..
* cd Player_Analysis
* grep -i '0315_win_loss_player_data:08:00:00 AM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '08:00:00 AM'
* cd ..
* cd Player_Analysis
* grep -i '0315_win_loss_player_data:02:00:00 PM' Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i '02:00:00 PM'
* chmod +x find_player_dealer.sh

#### 4. ./find_player_dealer.sh > Dealers_working_during_losses

1. 0310_win_loss_player_data:05:00:00 AM	-$82,348	Amirah Schneider,Nola Portillo, Mylie Schmidt,Suhayb Maguire,Millicent Betts,Avi Graves
* 05:00:00 AM Billy Jones
2. 0310_win_loss_player_data:08:00:00 AM	-$97,383	Chanelle Tapia, Shelley Dodson , Valentino Smith, Mylie Schmidt
* 08:00:00 AM Billy Jones
3. 0310_win_loss_player_data:02:00:00 PM	-$82,348	Jaden Clarkson, Kaidan Sheridan, Mylie Schmidt 
* 02:00:00 PM Billy Jones
4. 0310_win_loss_player_data:08:00:00 PM	-$65,348        Mylie Schmidt, Trixie Velasquez, Jerome Klein ,Rahma Buckley
* 08:00:00 PM Billy Jones
5. 0310_win_loss_player_data:11:00:00 PM	-$88,383	Mcfadden Wasim, Norman Cooper, Mylie Schmidt
* 11:00:00 PM Billy Jones
6. 0312_win_loss_player_data:05:00:00 AM	-$182,300	Montana Kirk, Alysia Goodman, Halima Little, Etienne Brady, Mylie Schmidt
* 05:00:00 AM Billy Jones
7. 0312_win_loss_player_data:08:00:00 AM	-$97,383        Rimsha Gardiner,Fern Cleveland, Mylie Schmidt,Kobe Higgins	
* 08:00:00 AM Billy Jones
8. 0312_win_loss_player_data:02:00:00 PM	-$82,348        Mae Hail,  Mylie Schmidt,Ayden Beil	
* 02:00:00 PM Billy Jones
9. 0312_win_loss_player_data:08:00:00 PM	-$65,792        Tallulah Rawlings,Josie Dawe, Mylie Schmidt,Hakim Stott, Esther Callaghan, Ciaron Villanueva	
* 08:00:00 PM Billy Jones
10. 0312_win_loss_player_data:11:00:00 PM	-$88,229        Vlad Hatfield,Kerys Frazier,Mya Butler, Mylie Schmidt,Lex Oakley,Elin Wormald	
* 11:00:00 PM Billy Jones
11. 0315_win_loss_player_data:05:00:00 AM	-$82,844        Arjan Guzman,Sommer Mann, Mylie Schmidt	
* 05:00:00 AM Billy Jones
12. 0315_win_loss_player_data:08:00:00 AM	-$97,001        Lilianna Devlin,Brendan Lester, Mylie Schmidt,Blade Robertson,Derrick Schroeder	
* 08:00:00 AM Billy Jones
13. 0315_win_loss_player_data:02:00:00 PM	-$182,419        Mylie Schmidt, Corey Huffman
* 02:00:00 PM Billy Jones

#### 5. cat Dealers_working_during_losses
* primary dealer working at the times where losses occurred is Billy Jones
* grep i 'Billy Jones' Dealers_working_during_losses > Notes_Dealer_Analysis
* nano Notes_Dealer_Analysis
* grep -i 'Billy Jones' Dealers_working_during_losses | wc -l 
* The dealer worked 13 times

#### 6. cd Player_Dealer_Correlation
* nano Notes_Player_Dealer_Correlation
* The player and dealer I believed are colluding to scam Lucky Duck are player Mylie Schmidt and dealer Billy Jones.
* Both player Mylie Schmidt and dealer Billy Jones were playing and working all the 13 times major losses occurred

### 4 Scripting Your Tasks
* nano roulette_dealer_finder_by_time.sh
* #!/bin/bash
* cd Player_Analysis
* grep -i $1_win_loss_player_data:"$2" Roulette_Losses
* cd ..
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, $5, $6}' $1_Dealer_schedule | grep -i "$3"
* Run by sh roulette_dealer_finder_by_time.sh 0310 '08:00:00 PM' '08:00:00 PM'
* Arguments $1 = 0312
* $2 = '08:00:00 PM'
* $3 = '08:00:00 PM'

Result
* 0312_win_loss_player_data:08:00:00 PM	-$65,792     Tallulah Rawlings,Josie Dawe, Mylie Schmidt,Hakim Stott, Esther Callaghan, Ciaron Villanueva	
* 08:00:00 PM Billy Jones

### Bonus
* nano roulette_dealer_finder_by_time_and_game.sh
* !/bin/bash
* cd Dealer_Analysis
* awk -F" " '{print $1, $2, '$3', '$4'}' $1_Dealer_schedule | grep -i "$2"
* Arguments $1 = 0312 Date
* $2 = '08:00:00 PM' Time
* $3 = '$3' Casino game being played first name 
* $4 = '$4' Casino game being played last name
* To view the dealer for Blackjack on March 10 at 8:00 a.m.
* run: sh roulette_dealer_finder_by_time_and_game.sh 0310 '08:00:00 AM' '$3' '$4'
* result: 08:00:00 AM Rahima Figueroa
* To view the dealer for Roulette on March 10 at 8:00 a.m.
* run: sh roulette_dealer_finder_by_time_and_game.sh 0310 '08:00:00 AM' '$5' '$6'
* result: 08:00:00 AM Billy Jones
* To view the dealer for Texas Hold 'Em on March 10 at 8:00 a.m.
* run : sh roulette_dealer_finder_by_time_and_game.sh 0310 '08:00:00 AM' '$7' '$8'
* result: 08:00:00 AM Madina Britton
