#!/bin/bash

xrandr --verbose \
    --output eDP-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal  --rate 60.00 \
    --output DisplayPort-1-0 --off \
    --output DP-0 --off \
    --output DP-1 --off \
    --output HDMI-0 --off

# echo 50 >/sys/devices/pci0000:00/0000:00:08.1/0000:07:00.0/backlight/amdgpu_bl0/brightness

./touchscreen.sh off




