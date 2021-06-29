#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/scripts/rofi/colors.rasi"
PTRANS="A1"
RTRANS="D1"

# Change colors
change_color() {
	# polybar
	sed -i -e 's/background = #.*/background = #32a1a1a1/g' $PFILE
	sed -i -e 's/foreground = #.*/foreground = #FFFFFF/g' $PFILE
	sed -i -e 's/foreground-alt = #.*/foreground-alt = #FF66A1g' $PFILE
	sed -i -e "s/color1 = #.*/color1 = #${PTRANS}${CURRENT_WINDOW_COLOR}/g" $PFILE
	sed -i -e "s/color2 = #.*/color2 = #${PTRANS}${SH2}/g" $PFILE
	sed -i -e "s/color3 = #.*/color3 = #${PTRANS}${MEASUREMENTS_COLOR}/g" $PFILE
	sed -i -e "s/color4 = #.*/color4 = #${PTRANS}${SH4}/g" $PFILE
	sed -i -e "s/color5 = #.*/color5 = #${PTRANS}${SH5}/g" $PFILE
	sed -i -e "s/color6 = #.*/color6 = #${PTRANS}${SH6}/g" $PFILE
	sed -i -e "s/color7 = #.*/color7 = #${PTRANS}${SH7}/g" $PFILE
	sed -i -e "s/color8 = #.*/color8 = #${PTRANS}${SH8}/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    #060812${RTRANS};
	  bg1:   #${SH2}${RTRANS};
	  bg2:   #${SH2}${RTRANS};
	  bg3:   #${SH6}${RTRANS};
	  fg:    #FFFFFFFF;
	}
	EOF
	
	polybar-msg cmd restart
}
if [[ $1 = "--dark" ]]; then
	CURRENT_WINDOW_COLOR="1B1d75"
	SH2="666666" 
	MEASUREMENTS_COLOR="004D40"
	SH4="004D40"
	SH5="1B5E20" 
	SH6="3E2723"
	SH7="1A237E"
	SH8="FFE082"
	change_color
else
	cat <<- _EOF_
	ERROR occured
	_EOF_
fi
