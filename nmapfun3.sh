#!/bin/bash

# Global styling
 print_message() {
    echo -e "\n======================"
    echo -e "$1"
    echo -e "======================\n"
}

# Check nmap is installed 
if ! command -v nmap &> /dev/null ; then 
    print_message "Nmap is not installed. Install and come back!"
    exit 1
fi

print_message "Nmap is installed and ready to scan."

# Get target IP
print_message "What IP do you want to scan?"
read -r ip

# Check valid IP entered
if [[ ! $target =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid IP address"
    exit 1
fi

# Stealth scan function
print_message "Run scan in stealth mode? y/n"
read -r stealth
case $stealth in
    [yY]) s="-sS";
     print_message "Sudo is required for this option";;
    [nN]) s="";;
    *) echo "Invalid input, stealth mode will not be set";;
esac

# Level of verbose (0-2)
print_message "Output verbosity? 0/1/2"
read -r verbose
case $verbose in 
    2) v="-vv";;
    1) v="-v";;
    0) v="";;
    *) v="";; # fail safe
esac

# Operating system check
print_message "Check to identify Operating System? y/n"
read -r operating
case $operating in
    [yY]) o="-O";
     print_message "Sudo is required for this option";;
    [nN]) o="";;
    *) echo "Invalid input, OS will not be checked";;
esac

# Option to specify a port/s 
print_message "Want to scan a specific port? (multiple separated by commas, no spaces)"
read -r ports
if [[ $ports =~ ^[0-9]{1,5}(,[0-9]{1,5})*$ ]]; then 
    print_message "Sudo is required for this option"
    p="-p $ports"
else
    p=""
fi 

# Output the scan command 
output="Scanning $ip with options: $s $v $o $p"
stripped_output=$(echo "$output" | sed 's/[[:space:]]\+/ /g')

# Scan function
print_message "$stripped_output"
scan_command="nmap $s $v $o $p $ip"


# Check if command needs sudo
if [[ $scan_command =~ [OpsS] ]]; then 
    sudo $scan_command
else
    $scan_command
fi