#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

HDMI_STATUS=$(</sys/class/drm/card2/card2-DVI-I-2/status )  
DP_STATUS=$(</sys/class/drm/card1/card1-DVI-I-1/status )
NATIVE_HDMI=$(</sys/class/drm/card0/card0-HDMI-A-1/status )
NATIVE_DP=$(</sys/class/drm/card0/card0-DP-1/status )

if [ "$HDMI_STATUS" = "connected" ] && [ "$DP_STATUS" = "connected" ]; then  
    MAIN_MONITOR="DVI-I-2-2"
elif [ "connected" = "$HDMI_STATUS" ]; then  
    MAIN_MONITOR="DVI-I-2-2"
elif [ "connected" = "$DP_STAUTS" ]; then  
    MAIN_MONITOR="DVI-I-1-1"
elif [ "connected" = "$NATIVE_HDMI" ]; then  
    MAIN_MONITOR="HDMI-1"
elif [ "connected" = "$NATIVE_DP" ]; then  
    MAIN_MONITOR="DP-1"
else
    MAIN_MONITOR="eDP1"
fi

# Launch bar1 and bar2
MAIN_MONITOR=$MAIN_MONITOR polybar primary &
MAIN_MONITOR=$MAIN_MONITOR polybar secondary &

notify-send "Polybars launched..."
