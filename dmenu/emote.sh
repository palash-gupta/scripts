cat /home/reiter/scripts/dmenu/dmenu-emoji.sh | dmenu | awk '{print $NF}' | tr -d '\n' | xclip -selection clipboard
