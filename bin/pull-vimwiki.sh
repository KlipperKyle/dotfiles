#!/bin/bash

# Pull a Vimwiki from another host
# Usage: pull-vimwiki.sh [user@]host

function fatal {
    echo "ERROR: $@" 1>&2
    echo "Usage: $0 [user@]host"
    exit 1
}

host="$1"

[[ ! -z "$host" ]] || fatal "Missing Hostname"

set -x
rsync -av --delete --exclude="*.swp" "$host:vimwiki/" "$HOME/vimwiki/"
rsync -av --delete --exclude="*.swp" "$host:vimwiki_html/" "$HOME/vimwiki_html/"
