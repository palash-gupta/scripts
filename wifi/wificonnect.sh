#!/bin/bash

declare -A wifisuffixes=( ["H"]="-C_HOSTEL" ["N"]="-NAB" ["B"]="" ["L"]="-WIFI" ["D"]="-DH" ["C"]="-CH")
echo "Enter location [H: DH3, C: Campus, N: NAB, L: Lecture Theatre, D: D-Mess, C: C-Mess"
read wifilocation

if [[ -v wifisuffixes["${wifilocation^^}"] ]]; then
    sudo nmcli dev wifi connect "BPGC${wifisuffixes["${wifilocation^^}"]}"
    chromium https://campnet.bits-goa.ac.in:8090/
else
    echo "incorrect location"
fi
