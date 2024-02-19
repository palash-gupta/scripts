dev=$(bluetoothctl devices Connected | awk '{print $3}')

if [[ "$dev" != "" ]]; then
    echo "󰂱 $dev"
fi
