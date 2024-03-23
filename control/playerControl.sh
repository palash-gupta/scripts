#!/bin/bash

playercount=$(playerctl --list-all | wc -l)

if [[ $playercount -gt 1 ]]; then
    playerctl -p $(playerctl --list-all | tac | dmenu) $1
else
    playerctl $1
fi
