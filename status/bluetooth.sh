dev=$(bluetoothctl devices Connected | awk '{print $3}')
bat=$(bluetoothctl info | grep Battery | awk '{print $3}')
if [[ "$dev" != "" ]]; then
    printf "󰂱 $dev %d%% | \n" $bat
fi
