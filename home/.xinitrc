# vim: set ft=sh :

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
export TERMINAL="urxvt -letsp -1"

userresources=$HOME/.Xresources
usertermcolors=$HOME/.Xtermcolors
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

[[ -f $sysresources   ]] && xrdb    -merge $sysresources
[[ -f $sysmodmap      ]] && xmodmap $sysmodmap
[[ -f $userresources  ]] && xrdb    -merge $userresources
[[ -f $usertermcolors ]] && xrdb    -merge $usertermcolors
[[ -f $usermodmap     ]] && xmodmap $usermodmap

xsetroot -cursor_name left_ptr

# displays the background.  to regenerate run `feh --bg-scale <file>`
sh ~/.fehbg &

#chromium --no-startup-window &
#gvim &
VBoxClient-all &
#systemd --user &  #run systemd as user instance

exec i3 -V >> ~/.i3/i3log 2>&1
