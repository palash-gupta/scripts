chromium $(nmcli -g c | grep inet4 | head -1 | awk '{split($2, a, "/"); print a[1]}')
