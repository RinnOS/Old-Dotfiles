#!/usr/bin/env bash

killall pulsemeeter
i3-msg -q "workspace 5:CHAT; append_layout ~/.config/i3/workspaces/pulsemeeter.json"
sleep .5
pulsemeeter &
