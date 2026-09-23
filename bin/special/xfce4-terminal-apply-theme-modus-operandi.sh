#!/bin/bash
# xfce4-terminal-apply-theme-modus-operandi.sh
# Apply colors from the modus-operandi GNU Emacs theme

xfconf-query -c xfce4-terminal -p /color-foreground -s '#000000'
xfconf-query -c xfce4-terminal -p /color-background -s '#ffffff'
xfconf-query -c xfce4-terminal -p /color-palette -s \
	     '#000000;#a60000;#006800;#6f5500;#0031a9;#721045;#005e8b;#a6a6a6;#595959;#972500;#00663f;#884900;#3548cf;#531ab6;#005f5f;#ffffff'
xfconf-query -c xfce4-terminal -p /color-bold-is-bright -s true

xfconf-query -c xfce4-terminal -p /color-bold -s ''
xfconf-query -c xfce4-terminal -p /color-bold-use-default -s true

xfconf-query -c xfce4-terminal -p /color-cursor -s ''
xfconf-query -c xfce4-terminal -p /color-cursor-foreground -s ''
xfconf-query -c xfce4-terminal -p /color-cursor-use-default -s true
xfconf-query -c xfce4-terminal -p /color-selection -s ''
xfconf-query -c xfce4-terminal -p /color-selection-background -s ''
xfconf-query -c xfce4-terminal -p /color-selection-use-default -s true

xfconf-query -c xfce4-terminal -p /tab-activity-color -s '#a60000'
xfconf-query -c xfce4-terminal -p /color-use-theme -s false
xfconf-query -c xfce4-terminal -p /color-background-vary -s false
