echo $(cat /tmp/audio-icon) $(pactl get-sink-volume $(cat /tmp/audio-sink) | grep Volume | awk '{print $5}')
