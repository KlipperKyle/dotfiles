#!/bin/bash
# git-gc.sh - garbage collect all git repos in the current directory.

for repo in * ; do
    # Make sure it is a directory
    if [ -d "$repo" ] ; then
	# Make sure it is a git repo
	if [ -d "${repo}/.git" -o -e "${repo}/HEAD" ] ; then
	    ( cd "$repo" ; echo "+ $repo" ; git gc "$@" )
	fi
    fi
done
