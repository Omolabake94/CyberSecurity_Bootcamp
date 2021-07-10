### cd  Step 3: Correlating the Evidence

grep command isolate all of the losses that occurred on March 10, 12, and 15.
* grep -$* * > Roulette_Losses

* grep -i 0310* Roulette_Losses | wc -l > Note_Player_Analysis
* grep -i 0312* Roulette_Losses | wc -l >> Note_Player_Analysis
* grep -i 0315* Roulette_Losses | wc -l >> Note_Player_Analysis
* grep -i 'mylie Schmidt' Roulette_Losses | wc -l >> Note_Player_Analysis

nano find_player_dealer.sh

Shell for each day
#!/bin/bash
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
grep -i '0310_win_loss_player_data:05:00:00 AM' Roulette_Losses
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '05:00:00 AM'

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
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep -i '08:00:00 PM'
 
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
grep -i '0312_win_loss_player_data:11:00:00 PM' Roulette_Losses
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

chmod +x find_player_dealer.sh

./find_player_dealer.sh > Dealers_working_during_losses

0310_win_loss_player_data:05:00:00 AM	-$82,348	Amirah Schneider,Nola Portillo, Mylie Schmidt,Suhayb Maguire,Millicent Betts,Avi Graves
05:00:00 AM Billy Jones
0310_win_loss_player_data:08:00:00 AM	-$97,383	Chanelle Tapia, Shelley Dodson , Valentino Smith, Mylie Schmidt
08:00:00 AM Billy Jones
0310_win_loss_player_data:02:00:00 PM	-$82,348	Jaden Clarkson, Kaidan Sheridan, Mylie Schmidt 
02:00:00 PM Billy Jones
0310_win_loss_player_data:08:00:00 PM	-$65,348        Mylie Schmidt, Trixie Velasquez, Jerome Klein ,Rahma Buckley
08:00:00 PM Billy Jones
0310_win_loss_player_data:11:00:00 PM	-$88,383	Mcfadden Wasim, Norman Cooper, Mylie Schmidt
11:00:00 PM Billy Jones
0312_win_loss_player_data:05:00:00 AM	-$182,300	Montana Kirk, Alysia Goodman, Halima Little, Etienne Brady, Mylie Schmidt
05:00:00 AM Billy Jones
0312_win_loss_player_data:08:00:00 AM	-$97,383        Rimsha Gardiner,Fern Cleveland, Mylie Schmidt,Kobe Higgins	
08:00:00 AM Billy Jones
0312_win_loss_player_data:02:00:00 PM	-$82,348        Mae Hail,  Mylie Schmidt,Ayden Beil	
02:00:00 PM Billy Jones
0312_win_loss_player_data:08:00:00 PM	-$65,792        Tallulah Rawlings,Josie Dawe, Mylie Schmidt,Hakim Stott, Esther Callaghan, Ciaron Villanueva	
08:00:00 PM Billy Jones
0312_win_loss_player_data:11:00:00 PM	-$88,229        Vlad Hatfield,Kerys Frazier,Mya Butler, Mylie Schmidt,Lex Oakley,Elin Wormald	
11:00:00 PM Billy Jones
0315_win_loss_player_data:05:00:00 AM	-$82,844        Arjan Guzman,Sommer Mann, Mylie Schmidt	
05:00:00 AM Billy Jones
0315_win_loss_player_data:08:00:00 AM	-$97,001        Lilianna Devlin,Brendan Lester, Mylie Schmidt,Blade Robertson,Derrick Schroeder	
08:00:00 AM Billy Jones
0315_win_loss_player_data:02:00:00 PM	-$182,419        Mylie Schmidt, Corey Huffman
02:00:00 PM Billy Jones
