#!/usr/bin/env bash

## restart i3
if [[ $1 = "restart" ]]; then
	i3-msg restart
	sleep 1
fi

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar main