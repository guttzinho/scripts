#!/bin/sh
# scrip to stop other things and don't just pop a lockscreen
playerctl pause
i3lock-fancy -f "Inter-Bold" -t "$(date +"%d %a %H:%M")"
