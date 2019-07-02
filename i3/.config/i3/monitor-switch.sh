#!/bin/bash

DIALOG_RESULT=$(echo -e 'auto\nsingle\ndual-monitor\nmirror\nHDMI-DP\nHDMI-2K' | rofi -dmenu -i -p "Choose monitors setup" -hide-scrollbar -tokenize -lines 6 -eh 1 -width 25 -location 0 -xoffset 0 -yoffset 0 -padding 20 -disable-history -font "ClearSansMedium 13")

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "auto" ];
then
    xrandr --output "$SINGLE_MONITOR" --auto
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DUAL monitors not implemented yet"
elif [ "$DIALOG_RESULT" = "single" ];
then
    SINGLE_MONITOR=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
    xrandr --output "$SINGLE_MONITOR" --auto --output HDMI1 --off --output DP1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected\n Using $SINGLE_MONITOR as main monitor"
elif [ "$DIALOG_RESULT" = "dual-monitor" ];
then
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DUAL monitors not implemented yet"
elif [ "$DIALOG_RESULT" = "mirror" ];
then
    xrandr --output DP1 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
elif [ "$DIALOG_RESULT" = "HDMI-2K" ];
then
    xrandr --output DP1 --off --output HDMI1 --mode 2560x1440 --pos 2560x0 --rotate normal --output eDP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP1 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
elif [ "$DIALOG_RESULT" = "HDMI-DP" ];
then
    xrandr --output DP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP1 --off --output HDMI2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI and DP plugged in"
elif [ "$DIALOG_RESULT" = "exit" ];
then
    exit 0
fi
$HOME/.config/polybar/launch.sh
