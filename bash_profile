#
# ~/.bash_profile
#

[ -f "$HOME/.env" ] && source "$HOME/.env"
[ "$SHELL" = "/bin/bash" -a -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
