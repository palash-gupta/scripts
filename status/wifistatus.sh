#!/bin/bash

connection=$(nmcli -g c | grep "wlo1: connected" | awk '{$1=$2=$3=""; print $0}' | tr -d ' ')
lan=$(nmcli -g c | grep "enp2s0: connected" | awk '{$1=$2=$3=""; print $0}' | tr -d ' ')

if [[ "$connection" != "" ]] then
    if [[ "$lan" != "" ]] then
        echo "󰖩 $connection | 󰌘 $lan"
    else
        echo "󰖩 $connection"
    fi
elif [[ "$lan" != "" ]] then
    echo "󰌘 $lan"
else
    echo "󰖪 No Network"
fi
