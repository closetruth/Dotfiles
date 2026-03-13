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
            pkill -u "$current" -f aw-watcher-window-wayland
        fi

        if [ -n "$user" ]; then

            uid=$(id -u "$user")

            if [ -S "/run/user/$uid/wayland-1" ]; then

                sudo runuser -u "$user" -- env \
                XDG_RUNTIME_DIR=/run/user/$uid \
                WAYLAND_DISPLAY=wayland-1 \
                /opt/activitywatch/aw-watcher-window-wayland/target/release/aw-watcher-window-wayland &

            else
                echo "No wayland for $user"
            fi

        fi

        current="$user"

    fi

    sleep 2

done
}

sudo runuser -u pub /opt/activitywatch/aw-server//aw-server &

switch_activitywatch

ydotoold &

pre_start_h-learn

start_ops
