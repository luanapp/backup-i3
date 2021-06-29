#!/bin/bash                                                                                                                                                                                                                                                    
# This script is intended to make switching between laptop and external displays easier when using i3+dmenu                                                                                                                                                    
# To run this script, map it to some shortcut in your i3 config, e.g:
# bindsym $mod+p exec --no-startup-id $config/display.sh
# IMPORTANT: run chmod +x on the script to make it executable
# The result is 4 options appearing in dmenu, from which you can choose

# This is your default laptop screen, detect by running `xrandr`
INTERNAL_OUTPUT="eDP-1-1"

# choices will be displayed in dmenu
choices="laptop\ndual\nexternal\nclone"

# Your choice in dmenu will determine what xrandr command to run
chosen=$(echo -e $choices | dmenu -i)                                                                                                                                                                           

# Valid for only one external output
EXTERNAL_OUTPUT=$(xrandr | egrep "\sconnected\s" | awk '{print $1}' | grep -v "$INTERNAL_OUTPUT")

# xrandr will run and turn on the display you want, if you have an option for 3 displays, this will need some modifications
echo "internal:$INTERNAL_OUTPUT, external:$EXTERNAL_OUTPUT"
case "$chosen" in
    external) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary ;;
    laptop) xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off ;;
    clone) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT ;;
    dual) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary ;;
esac
