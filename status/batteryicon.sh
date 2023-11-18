#!/bin/bash

status_=$(cat /sys/class/power_supply/BAT1/status)
capacity_=$(cat /sys/class/power_supply/BAT1/capacity)

if [[ "$status_" == "Discharging" ]]; then
    if [[ $capacity_ -gt 95 ]]; then
        echo "󰁹 $capacity_%"
    elif [[ $capacity_ -gt 90 ]]; then
        echo "󰂂 $capacity_%"
    elif [[ $capacity_ -gt 80 ]]; then
        echo "󰂁 $capacity_%"
    elif [[ $capacity_ -gt 70 ]]; then
        echo "󰂀 $capacity_%"
    elif [[ $capacity_ -gt 60 ]]; then
        echo "󰁿 $capacity_%"
    elif [[ $capacity_ -gt 50 ]]; then
        echo "󰁾 $capacity_%"
    elif [[ $capacity_ -gt 40 ]]; then
        echo "󰁽 $capacity_%"
    elif [[ $capacity_ -gt 30 ]]; then
        echo "󰁼 $capacity_%"
    elif [[ $capacity_ -gt 20 ]]; then
        echo "󰁻 $capacity_%"
    elif [[ $capacity_ -gt 10 ]]; then
        echo "󰁺 $capacity_%"
    elif [[ $capacity_ -lt 10 ]]; then
        echo "󰂎 $capacity_%"
    fi
elif [[ "$status_" == "Charging" ]]; then
    if [[ $capacity_ -gt 95 ]]; then
        echo "󰂅 $capacity_%"
    elif [[ $capacity_ -gt 90 ]]; then
        echo "󰂋 $capacity_%"
    elif [[ $capacity_ -gt 80 ]]; then
        echo "󰂊 $capacity_%"
    elif [[ $capacity_ -gt 70 ]]; then
        echo "󰢞 $capacity_%"
    elif [[ $capacity_ -gt 60 ]]; then
        echo "󰂉 $capacity_%"
    elif [[ $capacity_ -gt 50 ]]; then
        echo "󰢝 $capacity_%"
    elif [[ $capacity_ -gt 40 ]]; then
        echo "󰂈 $capacity_%"
    elif [[ $capacity_ -gt 30 ]]; then
        echo "󰂇 $capacity_%"
    elif [[ $capacity_ -gt 20 ]]; then
        echo "󰂆 $capacity_%"
    elif [[ $capacity_ -gt 10 ]]; then
        echo "󰢜 $capacity_%"
    elif [[ $capacity_ -lt 10 ]]; then
        echo "󰢟 $capacity_%"
    fi
elif [[ "$status_" == "Full" ]]; then
        echo "󰁹 $capacity_%"
fi    
