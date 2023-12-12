#!/bin/bash

if [ $# -lt 4 ]; then
    echo "Error. Too few arguments, must be 4 arguments" >&2
elif [ $# -gt 4 ]; then
    echo "Error. Too much arguments, must be 4 arguments" >&2
else
    if [[ $1 != [1-6] || $2 != [1-6] || $3 != [1-6] || $4 != [1-6] ]]; then
        echo "Error. The parameters must be digits from 1 to 6." >&2
    elif [[ $1 -eq $2 || $3 -eq $4 ]]; then
        echo "Error, The background and the font colors must not match" >&2
    else 
        if ! [ -x print.sh ]; then
            chmod +x print.sh
        fi
        ./print.sh $1 $2 $3 $4
    fi
fi
