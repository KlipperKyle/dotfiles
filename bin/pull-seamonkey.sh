#!/bin/bash

# Pull a SeaMonkey profile from another host
# Usage: pull-seamonkey.sh [-P <profile>] [user@]host

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

profile_dir=".mozilla/seamonkey/$profile"
cache_dir=".cache/mozilla/seamonkey/$profile"

[[ -h "$HOME/$profile_dir/lock" ]] && fatal "Profile $profile is running.  Exit SeaMonkey."
ssh "$host" test -h "$profile_dir/lock" && fatal "Profile $profile is running on remote host.  Exit remote SeaMonkey."

set -x
rsync -av --delete "$host:$profile_dir/" "$HOME/$profile_dir/"
rsync -av --delete "$host:$cache_dir/" "$HOME/$cache_dir/"
