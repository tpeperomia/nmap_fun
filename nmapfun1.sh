#!/bin/bash

# check nmap is installed

if command -v nmap &> /dev/null ; then
    echo "nmap installed and ready to scan";

# get target IP    
    echo -e "\nWhat are IP are we scanning?\n=======================================\n"
    read ip
# Stealth scan     
    echo -e "\nOn the down low? y/n\n========================================\n"
    read downlow
     if [[ $downlow == "y"||"Y" ]]; then 
        s="-sS"
        sleep 0.4
        echo -e "\nHeads up, gonna need sudo for that one!"
        sleep 0.4
    else 
        s=""
    fi    
# Verbose output
    echo -e "\nHow man words? loads/some/min\n========================================\n"
    read wordy
    if [[ $wordy == "loads" ]]; then
        v="-vv"
    elif [[ $wordy == "some" ]];  then
        v="-v"
    else
        v=""
    fi    
# nmap scan 
    if [[ $s == "-sS" ]]; then
        echo -e "\n========================================\nscanning $ip with the $v $s options\n========================================\n"
        sleep 1
        sudo nmap $v $s "$ip" 
    else
        echo -e "\n========================================\nscanning $ip with the $v $s options\n========================================\n"
        sleep 1   # pause for dramatic effect
        nmap $v $s "$ip" 
    fi
else
    echo -e "\n========================================\nnmap not installed! Download nmap to continue\n========================================\n"
    break
fi