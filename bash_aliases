#!/bin/bash
# ~/.bash_aliases

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

type fortune >/dev/null 2>&1 && fortune
