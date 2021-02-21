#!/bin/bash

if xrandr |grep disconnected |grep DP-0 > /dev/null; then

    xrandr --verbose \
        --output eDP-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
        --output DisplayPort-1-0 --mode 1920x550 --pos 0x1080 --rotate normal \
        --output DP-0 --off \
        --output DP-1 --off \
        --output HDMI-0 --off
        

else
    xrandr --verbose \
        --output eDP-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
        --output DisplayPort-1-0 --mode 1920x550 --pos 0x1080 --rotate normal \
        --output DP-0 --mode 2560x1440 --pos 1920x0 --rotate normal \
        --output DP-1 --off \
        --output HDMI-0 --off
        --brightness 0.8
fi

#echo 100 >/sys/devices/pci0000:00/0000:00:08.1/0000:07:00.0/backlight/amdgpu_bl0/brightness

./touchscreen.sh touchscreen
