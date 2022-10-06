#!/bin/sh
killall -q xborders
sleep 1
exec ~/Documents/git-stuff/xborder/xborders -c ~/.config/xborder/config.json
