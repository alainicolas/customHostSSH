#!/bin/bash
#Auto ssh using dedicated host file + applying diffie hellman group1

#Getting IP from dedicated host file
ip=$(cat host | grep $1 | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")

#If 1 result, get connected using DH group1
if [ ${#ip} -ge 16 ]; then echo "Error" ; 
        elif [ ${#ip} == 0 ]; then echo "No match" ; 
                else ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 user@$ip
fi
