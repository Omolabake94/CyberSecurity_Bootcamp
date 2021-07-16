#!/bin/bash
cd Dealer_Analysis
awk -F" " '{print $1, $2, '$3', '$4'}' $1_Dealer_schedule | grep -i "$2"
