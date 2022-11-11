#!/bin/bash

# Push a Vimwiki to another host
# Usage: push-vimwiki.sh [user@]host

function fatal {
    echo "ERROR: $@" 1>&2
    echo "Usage: $0 [user@]host"
    exit 1
}

host="$1"

[[ ! -z "$host" ]] || fatal "Missing Hostname"

set -x
rsync -av --delete --exclude="*.swp" "$HOME/vimwiki/" "$host:vimwiki/"
rsync -av --delete --exclude="*.swp" "$HOME/vimwiki_html/" "$host:vimwiki_html/"
