#!/bin/bash
swaymsg workspace 1 && 
swaymsg exec 'xfce4-terminal -x notes.bash'
swaymsg exec "xfce4-terminal -e 'nvim /home/pub/警告(warning).md'"
sleep 2

swaymsg workspace 2 && swaymsg exec firefox-dev
sleep 2

swaymsg workspace 3 && swaymsg exec firefox-esr
sleep 2

swaymsg workspace 1

