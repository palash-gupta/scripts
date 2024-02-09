#!/bin/bash

wifilocation=$(cat /home/reiter/scripts/wifi/ssids | dmenu)

sudo nmcli dev wifi connect $wifilocation
chromium --profile-directory="Default" https://campnet.bits-goa.ac.in:8090/
