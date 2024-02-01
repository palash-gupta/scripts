#!/bin/bash

wifilocation=$(cat /home/reiter/scripts/wifi/ssids | dmenu)

sudo nmcli dev wifi connect $wifilocation
chromium https://campnet.bits-goa.ac.in:8090/
