# !/bin/sh

# scale programs properly for HiDPI
#xrdb -merge ~/.Xresorces &
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &

# ensures you're not stuck in CAPS on mode
#xmodmap -e 'clear Lock' &
#remaps the keyboard so CAPS LOCK = ESC &
#xmodmap -e 'keycode 0x42=Escape' &

# speed X keyrpeat
xset r rate 400 25 &

# custom keybinding
xbindkeys &

# redshif 
#exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent &
/usr/lib/geoclue-2.0/demos/agent &
pgrep redshift &> /dev/null || redshift &> /dev/null &

# window effects
compton -b &

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
#xsetroot -gray &

# wallpaper
#feh --bg-fill "/home/faisal/Photo/wallpapers/IMG_398953.png" &

# start window manager script
exec dwm 
