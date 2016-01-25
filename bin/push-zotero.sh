#!/bin/bash

# Push Standalone Zotero data to another host
# Usage: push-zotero.sh [-P <profile>] [user@]host

function fatal {
    echo "ERROR: $@" 1>&2
    echo "Usage: $0 [-P <profile>] [user@]host"
    exit 1
}

profile='default'
host="$1"

if [[ "$1" = "-P" ]] ; then
    profile=$2
    host=$3
fi

[[ ! -z "$profile" ]] || fatal "Missing Profile"
[[ ! -z "$host" ]] || fatal "Missing Hostname"

profile_dir=".zotero/zotero/$profile"
cache_dir=".cache/zotero/zotero/$profile"

[[ -h "$HOME/$profile_dir/lock" ]] && fatal "Profile $profile is running.  Exit Zotero."
ssh "$host" test -h "$profile_dir/lock" && fatal "Profile $profile is running on remote host.  Exit remote Zotero."

set -x
rsync -av --delete "$HOME/$profile_dir/" "$host:$profile_dir/"
rsync -av --delete "$HOME/$cache_dir/" "$host:$cache_dir/"
