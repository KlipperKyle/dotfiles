#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

## .xautorun does this
#if [ -f "$userresources" ]; then
#	xrdb -merge "$userresources"
#fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

source "$HOME/.xautorun"

#exec xterm
#exec mwm
#exec twm
exec wmaker

# exec gnome-session
# exec startkde
#exec i3
#exec startxfce4
# ...or the Window Manager of your choice
#exec mate-session
