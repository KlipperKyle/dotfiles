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

# Start a D-Bus session
#source /etc/X11/xinit/xinitrc.d/30-dbus
# Start MATE Keyring
#eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
#export SSH_AUTH_SOCK
#export GPG_AGENT_INFO
#export GNOME_KEYRING_CONTROL
#export GNOME_KEYRING_PID

# Start the GnuPG agent and enable OpenSSH agent emulation
gnupginf="${HOME}/.gpg-agent-info"

if pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    eval `cat $gnupginf`
    eval `cut -d= -f1 $gnupginf | xargs echo export`
    export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
else
    eval `gpg-agent -s --enable-ssh-support --daemon --write-env-file "$gnupginf"`
fi

# Load Xresources
xrdb "$HOME/.Xresources"

# Mouse acceleration
xset m 4/1 4

# Keyboard
xset r rate 250 40
setxkbmap -option compose:caps
numlockx on

# Set the Desktop Environment
export DE=xfce

# Startup programs
dbus-launch --sh-syntax --exit-with-session &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
/usr/bin/gnome-keyring-daemon --start --components=secrets &
#xfsettingsd &
xsettingsd &
xset dpms 900 900 900 &
xset s off &
xautolock -time 15 -locker 'i3exit lock' &
#xfce4-power-manager &
#xscreensaver -no-splash &
#/home/kyle/bin/compton-start &
start-pulseaudio-x11 &
nm-applet &
xfce4-clipman &
#xfce4-notes &
#system-config-printer-applet &
#thunar --daemon &
#conky &
dropboxd &
#/home/kyle/bin/xpenguins-start &

#exec xterm
exec wmaker

# exec gnome-session
# exec startkde
exec i3
exec startxfce4
# ...or the Window Manager of your choice
#exec mate-session
