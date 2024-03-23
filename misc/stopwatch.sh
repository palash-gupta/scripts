seconds=28800
start="$(($(date +%s) + $seconds))"
while [ "$start" -ge `date +%s` ]; do
    time="$(( $start - `date +%s` ))"
    echo "$(date -u -d "@$time" "+%H : %M : %S")" | figlet
    sleep 1
done

