#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\n\[\033[00;01m\]\$\[\033[00m\] "

# Aliases
alias ll='ls -l'
alias la='ls -la'
alias clip='xclip -selection c'

# Quick fix for ssh'ing to non-urxvt aware servers
alias ssh='TERM=xterm ssh'

# fortune is a simple program that displays a pseudorandom message
# from a database of quotations at logon and/or logout.

#[[ "$PS1" ]] && /usr/bin/fortune
[[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune)\e[00m"  # Color: Brown
