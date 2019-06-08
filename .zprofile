# hide startx messages (autostart xorg)
#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null

# configure path
typeset -U path
path=(~/bin $path[@])

