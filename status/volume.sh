echo $(cat /tmp/audio-icon) $(pactl get-sink-volume 0 | grep Volume | awk '{print $5}')
