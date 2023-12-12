#!/bin/bash

if [ $# != 0 ]; then
    echo "Error, must be 0 arguments" >&2
else
    . config.sh
    if ! [ -x print.sh ]; then
        chmod +x print.sh
    fi
    ./print.sh $column1_background $column1_font_color $column2_background $column2_font_color
fi
