#!/usr/bin/env bash

pre_start_h-learn() {
	chvt 1
	#sleep 4
	sleep 6

	ydotool type "h-learn"
	ydotool key 28:1 28:0

	sleep 1
	ydotool type "1354"
	ydotool key 28:1 28:0

	sleep 1
	ydotool type "sway -V"
}


start_ops() {
	chvt 3
	#sleep 4
	sleep 6

	ydotool type "ops"
	ydotool key 28:1 28:0

	sleep 1
	ydotool type "1354"
	ydotool key 28:1 28:0

	sleep 1
	ydotool type "sway -V"
	ydotool key 28:1 28:0

}

switch_activitywatch() {
current=""

while true; do
    tty=$(cat /sys/class/tty/tty0/active)
    user=$(who | awk -v t="$tty" '$2==t {print $1}')

    if [ "$user" != "$current" ]; then
        echo "Switch to $user"

        if [ -n "$current" ]; then
            sudo -u "$current" pkill -f aw-watcher
        fi

        if [ -n "$user" ]; then
            sudo -u "$user" aw-watcher-window &
        fi

        current="$user"
    fi

    sleep 2
done

}


runuser -u pub /opt/activitywatch/aw-server//aw-server &


# switch_activitywatch

ydotoold &

pre_start_h-learn

start_ops
