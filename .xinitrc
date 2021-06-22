# !/bin/sh

# scale programs properly for HiDPI
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# speed X keyrpeat
xset r rate 400 25 &

# custom keybinding
xbindkeys &

# change CapsLock to Ctrl
#xmodmap ~/.disable_capslock &

# redshif 
#exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent &
/usr/lib/geoclue-2.0/demos/agent &
pgrep redshift &> /dev/null || redshift &> /dev/null &

# compositor
#picom -b &

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
feh --bg-fill "/home/faisal/Downloads/images/pexels-pixabay-122429.jpg" &

# blue tooth mouse
#bluetoothctl connect 00:02:76:19:CF:17 &

# start window manager
exec dwm 
#exec xmonad
