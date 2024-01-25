#!/bin/bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_volume {
    pactl get-sink-volume 0 | grep Volume | awk '{print $5}' | cut -d '%' -f 1
}

function is_mute {
    pactl get-sink-mute 0 | awk '{print $2}'
}

function send_notification {
  iconSound="/usr/share/icons/Papirus/24x24/panel/audio-volume-high.svg"
  iconMuted="/usr/share/icons/Papirus/24x24/panel/audio-volume-muted.svg"
  if [[ "$(is_mute)" == "yes" ]]; then
    volume=$(get_volume)
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq --separator="-" 5 "$((volume / 5))" | sed 's/[0-9]//g')
    padding=$(seq --separator="⠀" 5 "$((40 - volume / 5))" | sed 's/[0-9]//g')
    # Send the notification
    dunstify -i $iconMuted -r 5555 -u normal -t 1200 " $bar$padding"
    echo "󰝟" > /tmp/audio-icon
  else
    volume=$(get_volume)
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq --separator="-" 5 "$((volume / 5))" | sed 's/[0-9]//g')
    padding=$(seq --separator="⠀" 5 "$((40 - volume / 5))" | sed 's/[0-9]//g')
    # Send the notification
    dunstify -i $iconSound -r 5555 -u normal -t 1200 " $bar$padding"
    echo "󰕾" > /tmp/audio-icon
  fi
}

case $1 in
  up)
    # set the volume on (if it was muted)
    pactl set-sink-mute 0 off
    # up the volume (+ 5%)
    pactl set-sink-volume 0 +5%
    send_notification
    ;;
  down)
    pactl set-sink-volume 0 -5%
    send_notification
    ;;
  mute)
    # toggle mute
    pactl set-sink-mute 0 toggle
    send_notification
    ;;
esac
