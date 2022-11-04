#!/bin/bash

#   Run this script to set your own localserver to be accessed by other devices.
#
#   Either put this in root of the chosen directory and double tap enter,
#    or run and provide the directory to be shared and port to be hosted.
#
#   Type $> bash run_local_server.sh
#   
#   The program will automatically fetch your ipv4 address. 
#
#   To make the connection, open browser and type the underlined code in search bar.
#
#   To stop exectution press Ctrl-C.
# 
#   ! This program needs root permissions to run and will deactivate your firewall
#    while running !


# Colors 

GREEN='\033[1;32m'
RED='\033[1;31m'
RESET='\033[0m'


# Gets directory from user input and checks if it exists. Sets to current directory if no directory is provided. 
# Exits if directory not found

echo "(Press enter to select current folder)"
read -p 'Path to the directory where you want to launch server: ' PATH_TO_DIR
if [ -z "$PATH_TO_DIR" ]; then
    echo -e "${GREEN}Current folder has been selected!${RESET}"
    PATH_TO_DIR="./"
fi
if [ -d "$PATH_TO_DIR" ]; then
    echo -e "${GREEN}$PATH_TO_DIR exists!${RESET}"
fi
if [ ! -d "$PATH_TO_DIR" ]; then
    echo -e "${RED}$PATH_TO_DIR does not exist!${RESET}"
    echo -e "${RED}Exiting program.${RESET}"
    exit 0
fi

# Gets port from user, 8000 is selected if no port is provided

echo "(Press enter to select port 8000)"
read -p 'Port to launch on: ' LAUNCH_PORT

if [ ! -z "$LAUNCH_PORT" ]; then
    echo -e "${GREEN}Port set to: $LAUNCH_PORT${RESET}"
else
    LAUNCH_PORT=8000
    echo -e "${GREEN}Port set to: 8000${RESET}"
fi

# Turns off firewall, otherwise it won't work

sudo ufw allow $LAUNCH_PORT

# Gets ipv4 address of the sharing device

IP_HOST=`hostname -I | awk '{print $1}' | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'`

echo ""
printf "${GREEN}Type this in the device you want to connect with->  \e[4m%s:%s\e[0m${RESET}" "$IP_HOST" "$LAUNCH_PORT"
echo ""
echo ""

# Start server with provided information

python3 -m http.server -b $IP_HOST -d $PATH_TO_DIR $LAUNCH_PORT

# Turn firewall back on after execution

sudo ufw deny $LAUNCH_PORT
