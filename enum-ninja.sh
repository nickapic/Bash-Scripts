#!/bin/bash

RED="31"
GREEN="32"
BOLDRED="\e[1;${RED}m"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"
echo -e "----------------------------------------------------------"
echo -e "${BOLDGREEN}EnumNinja a tiny lil script to ennumerate basic stuff in Linux for Privilege Escalation.${ENDCOLOR}"
echo -e "${BOLDGREEN}Made by : Nickapic${ENDCOLOR}"
echo -e "----------------------------------------------------------"

if [ $1 = '-h' ]; then
        echo "Usage: Just run the script and it should do basic enum script"
        exit 1
    fi

varpython=`which python`
if [ -z "$varpython" ]
then
    echo "${BOLDRED}Yo my dude python isnt on this box hold up lemme check for some other one!${ENDCOLOR}"
    varpython=`which python3`
else
    echo -e "${BOLDGREEN}We all good here we have $varpython on this box ${ENDCOLOR}"
fi

echo "--------------------------------------------------"
echo -e "${BOLDRED}Checking for SUID/GUID bits and printing them out${ENDCOLOR}"
echo "--------------------------------------------------"
find / -perm -u=s -type f 2>/dev/null
echo "--------------------------------------------------"
echo -e "${BOLDRED}Checking permissions on passwd/shadow files${ENDCOLOR}"
echo "--------------------------------------------------"
ls -la /etc/passwd
ls -la /etc/shadow
echo "--------------------------------------------------"
echo -e "${BOLDRED}Checking some basic crontabs and if there are crontabs running${ENDCOLOR}"
echo "--------------------------------------------------"
cat /etc/crontab
echo "--------------------------------------------------"
echo -e "${BOLDRED}Checking what stuff is running internally on which ports${ENDCOLOR}"
echo "--------------------------------------------------"
netstat -aln
echo "--------------------------------------------------"
echo -e "${BOLDRED}Checking some basic stuff thats running using ps aux${ENDCOLOR}"
echo "--------------------------------------------------"
ps aux
echo "--------------------------------------------------"
echo -e "${BOLDRED}Checking Internal network interfaces${ENDCOLOR}"
ifconfig
echo -e "${BOLDRED}Checking ARP ${ENDCOLOR}"
arp -a
echo "--------------------------------------------------"
echo -e "${BOLDRED} See Writable Files by the user ${ENDCOLOR}"
 find /etc -type f -writable 2> /dev/null
echo "--------------------------------------------------"
echo -e "${BOLDRED} Kernel Version ${ENDCOLOR}"
uname -a
echo "--------------------------------------------------"
