#!/bin/sh
#
# ~/.xsession
#
# Executed by display manager (xdm, SLiM)

# For some reason, this block doesn't work in .env
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Source environment variables
# SLiM does this for you automatically.
# LightDM does not.
#source "$HOME/.bash_profile"

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

# X programs
source "$HOME/.xautorun"

# Window manager
exec /etc/X11/Sessions/wmaker
#twm &
#exec xterm
