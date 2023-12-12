#!/bin/bash

if [ $# != 1 ]; then
    echo "Error, must be only 1 parameter" >&2
elif [ -d "$1" ]; then
    if ! [ -x print.sh ]; then
        chmod +x print.sh
    fi
    ./print.sh $1
else
    echo "No such directory" >&2
fi