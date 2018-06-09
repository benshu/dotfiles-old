#!/bin/sh

# Get out of town if something errors
set -e

HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )  
DP_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )

if [ "connected" == "$HDMI_STATUS" -a "connected" == "$DP_STAUTS" ]; then  
    xrandr --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off
elif [ "connected" == "$HDMI_STATUS" ]; then  
    xrandr --output DP-1 --off --output HDMI-1 --mode 2560x1440 --pos 2560x0 --rotate normal --output eDP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
elif [ "connected" == "$DP_STAUTS" ]; then  
    xrandr --output HDMI-1 --off --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP-1 --mode 1920x1080 --pos 0x0 --output HDMI-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "VGA plugged in"
else  
    /usr/bin/xrandr --output eDP-1 --auto --output HDMI-1 --off --output HDMI-2 --off --output DP-1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"    
    exit
fi

