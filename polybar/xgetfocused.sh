#!/bin/sh
DESKTOP=$(xdotool getwindowfocus)

if [[ $DESKTOP != "2097232"  ]]; then
	xprop -id $(xdotool getwindowfocus -f) | grep WM_CLASS | awk {'print $4'} |cut -d'"' -f2
else
	echo "i3"
fi
