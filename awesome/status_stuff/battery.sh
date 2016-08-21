#!/bin/sh

notify-send "Battery" "` upower  -i /org/freedesktop/UPower/devices/battery_BAT0 |grep -E 'percentage|time to|state'`"

