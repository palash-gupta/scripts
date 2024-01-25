#!/bin/bash

connection=$(nmcli -g c | grep "wlo1: connected" | awk '{$1=$2=$3=""; print $0}' | tr -d ' ')

if [[ "$connection" == "" ]] then
    echo "󰖪 No Network"
else
    echo "󰖩 $connection"
fi
