#!/bin/bash
if [ $1 == "" ]
then 
echo "You forgot to enter the IP address you wanted to sweep"
echo "Syntax ./scriptname.sh 192.18.1"

else 
for ip in `seq 1 254` : do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done 
fi