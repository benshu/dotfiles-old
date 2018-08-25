#!/bin/bash

# Get out of town if something errors
set -e

echo "starting"
# HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )  
# DP_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )
HDMI_STATUS=$(</sys/class/drm/card2/card2-DVI-I-2/status )  
DP_STATUS=$(</sys/class/drm/card1/card1-DVI-I-1/status )

if [ "$HDMI_STATUS" = "connected" ] && [ "$DP_STATUS" = "connected" ]; then  
    echo "xrandr --output DVI-I-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-2-2 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off"
    xrandr --output DVI-I-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-2-2 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI and DP plugged in"
    exit
elif [ "connected" = "$HDMI_STATUS" ]; then  
    echo "xrandr --output DVI-I-1-1 --off --output DVI-I-2-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off"
    xrandr --output DVI-I-1-1 --off --output DVI-I-2-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
    exit
elif [ "connected" = "$DP_STAUTS" ]; then  
    echo "xrandr --output DVI-I-2-2 --off --output DVI-I-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP-1 --mode 1920x1080 --pos 0x0 --output HDMI-2 --off"
    xrandr --output DVI-I-2-2 --off --output DVI-I-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP-1 --mode 1920x1080 --pos 0x0 --output HDMI-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "VGA plugged in"
    exit
else  
    echo "xrandr --output eDP-1 --auto --output DVI-I-2-2 --off --output HDMI-2 --off --output DVI-I-1-1 --off"
    xrandr --output eDP-1 --auto --output DVI-I-2-2 --off --output HDMI-2 --off --output DVI-I-1-1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"    
    exit
fi

