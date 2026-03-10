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


ydotoold &


pre_start_h-learn

start_ops



