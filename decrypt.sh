#!/bin/bash
if [[ "$#" -ne "1" ]];
    then
    echo 'no args'
    exit 1
fi

if [[ -e $1 ]];
    then
    openssl enc -d -aes-256-cbc -in $1 -out $(echo $1 | sed 's/.enc//')
    if [ "$?" -ne "0" ];
        then
        echo "decrypt failed"
    fi 
fi