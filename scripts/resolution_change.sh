#!/bin/sh

# FLAG_FILE="$HOME/dotfiles/scripts/flags/monitors_in_extend_mode_flag"

# echo $MONITORS_MODE
# if [ -f "$FLAG_FILE" ]; then 
#     echo MONITORS_MODE
#     hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x1080, 1"
#     hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1"
# else
#     echo "ty ty ty"
# fi



#"Extend" # + "Mirror"
# export MY_VAR="Hello World"


NO_HDMI=$(hyprctl monitors all | grep "HDMI-A-1")
DELL=$(hyprctl monitors all | grep "make: Dell Inc.")
# echo $NO_HDMI
# echo $DELL
if [ -z "$NO_HDMI" ]; then
    hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x1080, 1"
    hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1"
elif [ -n "$DELL" ]; then
    hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x1080, 1"
    hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1"
else
    hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"
    hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1, mirror, eDP-1"
fi




# Normal:
# hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x1080, 1"
# hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1"

# mirroring:
# hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"
# hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1, mirror, eDP-1"

# resolution=$(xrandr | grep '*')
# echo "$resolution"
# if [ $resolution == "1920x1080" ]; then
#     echo "py py py"

# else
#     echo "ty ty ty"
# fi
