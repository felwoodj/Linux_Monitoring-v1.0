#!/bin/bash

if [ $# != 0 ]; then
    echo "Too many arguments" >&2
else 
    . ./print.sh
    print_sys
    read -p "Do you want to save it in file? (Y/N) " answer
    if [[ $answer = "y" || $answer = "Y" ]]; then
        print_sys > $(date +%d_%m_%Y_%H_%M_%S).status
    else 
	exit 1
    fi
fi
