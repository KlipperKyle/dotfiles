#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

# Enable colors
# TODO: disable colors on non-color terminals
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[07m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Set a nice PS1
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\n\[\033[00;01m\]\$\[\033[00m\] "

# Aliases
#alias x='exec startx'
alias ll='ls -l'
alias la='ls -la'
alias xyzzy='cd ~-/'
alias clip='xclip -selection c'
function qr { qrencode -o - $@ | display; }

# Quick fix for ssh'ing to non-urxvt-256color aware servers
alias ssh='TERM=rxvt-unicode ssh'

## Use gpg-agent for ssh-keys
#if [ -f "${HOME}/.gpg-agent-info" ]; then
#    . "${HOME}/.gpg-agent-info"
#    export GPG_AGENT_INFO
#    export SSH_AUTH_SOCK
#fi

# fortune is a simple program that displays a pseudorandom message
# from a database of quotations at logon and/or logout.

FORTUNE="/usr/bin/fortune"
#[[ "$PS1" ]] && $FORTUNE
[[ "$PS1" ]] && echo -e "\e[00;33m$($FORTUNE)\e[00m"  # Color: Brown
unset FORTUNE

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash
