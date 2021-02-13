#!/bin/bash

xrandr \
    --output eDP --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DisplayPort-0 --mode 1920x550 --pos 0x1080 --rotate normal \
    --output DP-1-0 --mode 2560x1440 --pos 1920x0 --rotate normal \
    --output DP-1-1 --off \
    --output HDMI-1-0 --off

./touchscreenON.sh




