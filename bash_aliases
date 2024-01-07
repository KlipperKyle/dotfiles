#!/bin/bash
# ~/.bash_aliases

# Emacs inferior shells, 9term, etc
if [[ "$TERM" == "dumb" ]]; then
    export PAGER=cat
else
    unset PAGER
fi

shopt -s globstar

# Debian packaging
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion -o filenames dquilt
