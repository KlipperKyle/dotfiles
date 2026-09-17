#!/bin/bash
# ~/.bash_aliases

# If this is an xterm, then put the running command in the title
case "$TERM" in
    xterm*|rxvt*)
	PS0='\[\e]0;$(HISTTIMEFORMAT= history 1 | sed -e "s/^ *[0-9]* *//")${SSH_CONNECTION:+ [\u@\h]}\a\]'
	;;
    *)
	;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --hyperlink=auto -F'
    alias dir='dir --color=auto --hyperlink=auto -F'
    alias vdir='vdir --color=auto --hyperlink=auto -F'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Emacs inferior shells, 9term, etc
if [[ "$TERM" == "dumb" ]]; then
    export PAGER=cat
else
    unset PAGER
fi

shopt -s globstar

# # perlbrew
# perlbrew() {
#     unset PERL5LIB PERL_MB_OPT PERL_MM_OPT PERL_LOCAL_LIB_ROOT
#     . "${PERLBREW_ROOT:-$HOME/perl5/perlbrew}/etc/bashrc" && perlbrew "$@"
# }

# type fortune >/dev/null 2>&1 && fortune
