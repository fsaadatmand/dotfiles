# !/bin/sh

# scale programs properly for HiDPI
#xrdb -merge ~/.Xresorces &
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &

# custom keybinding
xbindkeys &

# redshif 
pgrep redshift &> /dev/null || redshift &> /dev/null &

# window effects
# compton -b &

	# dwm status bar
	/usr/bin/slstatus &

	# lock screen after 10 mins of inactivity
	xset s 900 &
	/home/faisal/bin/xsidle.sh slock &

	# 2nd  MOD key
	/home/faisal/bin/dwm_2ndmod &

	# clipboard daemon
	clipmenud &

	# X background colour
	xsetroot -gray

	# wallpaper
	#feh --bg-fill "/home/faisal/Photo/wallpapers/IMG_398953.png" &

	# start window manager script
	exec dwm 
	#exec notion
