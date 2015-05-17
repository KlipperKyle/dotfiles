#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

source "$HOME/.xautorun"

#exec xterm
exec wmaker

# exec gnome-session
# exec startkde
#exec i3
#exec startxfce4
# ...or the Window Manager of your choice
#exec mate-session
