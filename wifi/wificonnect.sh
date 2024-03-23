#!/bin/bash

(nmcli general status | grep "^connected") && /home/reiter/dev/auto-campnet-login/main.py login ||
(wifilocation=$(cat /home/reiter/scripts/wifi/ssids | dmenu)
sudo nmcli dev wifi connect $wifilocation; /home/reiter/dev/auto-campnet-login/main.py login)
#chromium --profile-directory="Default" https://campnet.bits-goa.ac.in:8090/
