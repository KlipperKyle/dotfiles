#!/bin/bash
dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
sleep 0.5
sudo sh -c 'echo -n mem > /sys/power/state'
