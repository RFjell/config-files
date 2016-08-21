#!/bin/bash

if [ $(synclient -l | grep TouchpadOff | gawk -F '= ' '{print $2}') -eq 0 ]; then
	synclient TouchpadOff=1
	notify-send "Touchpad" "Touchpad inaktiverad"
else
	synclient TouchpadOff=0
	notify-send "Touchpad" "Touchpad aktiverad"
fi

