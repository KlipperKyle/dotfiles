#!/bin/bash
# ~/.bash_aliases

shopt -s globstar

# Debian packaging
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion -o filenames dquilt
