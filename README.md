# Nmap Scan Automation Script &#127758;

This script automates the process of running Nmap scans on a specified target IP address. It allows you to configure various scan options such as stealth mode, verbosity, operating system detection, and specific port scanning, all through a simple command-line interface.

## Features
* Check if Nmap is installed: Verifies if Nmap is available on your system.
* Customisable Scan Options: Choose from a variety of options:
    * Stealth mode (SYN scan)
    * Verbosity levels (0-2)
    * Operating system detection
    * Specific port scans
* Sudo handling: Some options require sudo privileges, and the script will prompt for this when needed.

## Requirements
* Nmap: Ensure Nmap is installed on your machine. If it's not, the script will notify you to install it.

## Installation
1. Clone or download the script to your local machine.
2. Ensure you have Nmap installed. If not, you can install it with the following:
    * On Ubuntu: sudo apt install nmap
    * On macOS: brew install nmap
    * On Windows: Download Nmap from the official website Nmap.org.

## Usage
1. Make the script executable:
```
chmod +x nmap_scan.sh
```
2. Run the script:
```
./nmap_scan.sh
```
3. Follow the prompts:
* Enter the target IP address you want to scan.
* Choose whether you want to run the scan in stealth mode (SYN scan).
* Select the verbosity level for the output (0, 1, or 2).
* Decide if you want to check the target's operating system.
* Specify ports to scan (optional).
4.  Sudo: Some features like stealth scanning and OS detection require root privileges. The script will automatically request sudo when needed.