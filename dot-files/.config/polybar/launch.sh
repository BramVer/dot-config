#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


for m in $(xrandr -q | grep -v " primary" | grep " connected" | cut -d ' ' -f1
); do
    echo $m
    MONITOR=$m polybar --reload subbar &
    MONITOR=$m polybar --reload subbotbar &
done

# Launch bar1 and bar2
polybar bottombar & polybar main
polybar subbar
polybar subbotbar


echo "Bars launched..."
