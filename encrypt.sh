#!/bin/bash
if [[ "$#" -ne "1" ]];
    then
    echo 'no args'
    exit 1
fi

[[ -e $1 ]] && openssl enc -aes-256-cbc -salt -in $1 -out ${1}.enc
[[  $? -eq 0 ]] && rm $1 || echo "Something goes wrong"