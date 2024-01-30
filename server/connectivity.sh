pgrep -w "flask" && sudo pkill flask || $(cd /home/reiter/dev/connectivity-app/ && sudo flask run --host=0.0.0.0 --port=80)
