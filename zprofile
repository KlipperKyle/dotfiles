#!/bin/zsh -f
# ~/.zprofile

# Make sure the following line is in /etc/zsh/zprofile to source the
# system-wide /etc/profile.  If it is not, and you cannot modify the
# system-wide zprofile, then uncomment the following line.
#
# emulate sh -c '. /etc/profile'


# Source the user’s profile.
[ -e "$HOME/.profile" ] && emulate sh -c '. "$HOME/.profile"'
