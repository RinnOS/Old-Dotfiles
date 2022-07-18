#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/middleBar.log /tmp/rightBar.log /tmp/leftBar.log
polybar middle 2>&1 | tee -a /tmp/middleBar.log & disown
polybar right 2>&1 | tee -a /tmp/rightBar.log & disown
polybar left 2>&1 | tee -a /tmp/leftBar.log & disown

echo "Bars launched..."
