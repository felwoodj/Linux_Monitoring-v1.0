#!/bin/bash

#1 parameter
input='^[+-]?[0-9]+([.][0-9]+)?$'
if [ $# == 1 ]; then
    if [[ $1 =~ $input ]]; then
        echo "Error: invalid input. Please enter a text parameter" >&2
    else 
        echo "$1"
    fi
else
    echo "Only 1 parameter allowed" >&2
fi











