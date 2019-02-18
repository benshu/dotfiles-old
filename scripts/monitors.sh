#!/bin/bash

# Get out of town if something errors
set -e

echo "starting"
HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )  
DP_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )

if [ "$HDMI_STATUS" = "connected" ] && [ "$DP_STATUS" = "connected" ]; then  
    echo "xrandr --output DP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP1 --off --output HDMI2 --off"
    xrandr --output DP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP1 --off --output HDMI2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI and DP plugged in"
    exit
elif [ "connected" = "$HDMI_STATUS" ]; then  
    echo "xrandr --output DP1 --off --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off"
    xrandr --output DP1 --off --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
    exit
elif [ "connected" = "$DP_STAUTS" ]; then  
    echo "xrandr --output HDMI1 --off --output DP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --output HDMI2 --off"
    xrandr --output HDMI1 --off --output DP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --output HDMI2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "VGA plugged in"
    exit
else  
    echo "xrandr --output eDP1 --auto --output HDMI1 --off --output HDMI2 --off --output DP1 --off"
    xrandr --output eDP1 --auto --output HDMI1 --off --output HDMI2 --off --output DP1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"    
    exit
fi
