#!/bin/bash
# ~/.bash_aliases

# Emacs inferior shells, 9term, etc
if [[ "$TERM" == "dumb" ]]; then
    export PAGER=cat
else
    unset PAGER
fi

shopt -s globstar

# perlbrew
perlbrew() {
    . "${PERLBREW_ROOT:-$HOME/perl5/perlbrew}/etc/bashrc" && perlbrew "$@"
}
