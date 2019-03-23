#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )
DP_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )

if [[ -z "${MAIN_MONITOR}" ]]; then
    if [ "$HDMI_STATUS" = "connected" ] && [ "$DP_STATUS" = "connected" ]; then
        MAIN_MONITOR="DP1"
    elif [ "connected" = "$HDMI_STATUS" ]; then
        MAIN_MONITOR="HDMI1"
    elif [ "connected" = "$DP_STAUTS" ]; then
        MAIN_MONITOR="DP1"
    else
        MAIN_MONITOR="eDP1"
    fi
else
    echo "setting monitor from env variable"
    MAIN_MONITOR="${MAIN_MONITOR}"
fi

# Launch bar1 and bar2
MAIN_MONITOR=$MAIN_MONITOR polybar primary &
MAIN_MONITOR=$MAIN_MONITOR polybar secondary &

notify-send "Polybars launched..."
