#!/usr/bin/env bash

# terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# create the log files
echo "---" | tee -a /tmp/polybar-main.log

# load the main monitor bar
polybar -r main -c "$HOME/.config/polybar/desktop_config.ini" 2>&1 | tee -a /tmp/polybar-main.log & disown 

# load the side monitor bar
polybar -r side -c "$HOME/.config/polybar/desktop_config.ini" 2>&1 | tee -a /tmp/polybar-side.log & disown 

# log
echo "main bar launched ..."
