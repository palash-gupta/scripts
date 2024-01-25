#!/bin/bash

status_=$(cat /sys/class/power_supply/BAT1/status)
capacity_=$(cat /sys/class/power_supply/BAT1/capacity)

charging_=$(cat /tmp/battery-charging-notification)
battery_=$(cat /tmp/battery-notification)

if [[ "$status_" == "Discharging" ]]; then
    if [[ "${charging_}" == "charging" ]]; then
        echo discharging > /tmp/battery-charging-notification
        echo no > /tmp/battery-notification
    fi
    if [[ "${charging_}" == "charged" ]]; then
        echo discharging > /tmp/battery-charging-notification
        echo no > /tmp/battery-notification
    fi
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
        if [[ "${battery_}" == "no" ]]; then
            dunstify -i /usr/share/icons/Papirus/48x48/status/battery-caution.svg "Battery Low"
            echo low > /tmp/battery-notification
        fi
        echo "󰁻 $capacity_%"
    elif [[ $capacity_ -gt 10 ]]; then
        if [[ "${battery_}" == "no" ]]; then
            dunstify -i /usr/share/icons/Papirus/48x48/status/battery-caution.svg "Battery Low"
            paplay /home/reiter/scripts/status/low_battery.mp3
            echo low > /tmp/battery-notification
        fi
        echo "󰁺 $capacity_%"
    elif [[ $capacity_ -lt 11 ]]; then
        if [[ "${battery_}" == "low" ]]; then
            dunstify -i /usr/share/icons/Papirus/48x48/status/battery-caution.svg -u critical "Battery Critical"
            paplay /home/reiter/scripts/status/critical_battery.mp3
            echo critical > /tmp/battery-notification
        fi
        echo "󰂎 $capacity_%"
    fi
elif [[ "$status_" == "Charging" ]]; then
    if [[ "${charging_}" == "discharging" ]]; then
        echo charging > /tmp/battery-charging-notification
        echo no > /tmp/battery-notification
    fi
    if [[ $capacity_ -gt 95 ]]; then
        if [[ "${charging_}" == "charging" ]]; then
            dunstify -i /usr/share/icons/Papirus/48x48/status/battery-full-charged.svg "Battery Charged"
            paplay /home/reiter/scripts/status/charged_battery.mp3
            echo charged > /tmp/battery-charging-notification
        fi
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
    elif [[ $capacity_ -lt 11 ]]; then
        echo "󰢟 $capacity_%"
    fi
elif [[ "$status_" == "Full" ]]; then
    echo "󰁹 $capacity_%"
    if [[ "${charging_}" == "discharging" ]]; then
        echo charging > /tmp/battery-charging-notification
        echo no > /tmp/battery-notification
    fi
fi    
