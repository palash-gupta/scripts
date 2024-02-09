pgrep -w "flask" && /home/reiter/scripts/server/kill.sh || $(dunstify -r 53535 "Server started" && cd /home/reiter/dev/connectivity-app/ && sudo flask run --host=0.0.0.0 --port=80)
