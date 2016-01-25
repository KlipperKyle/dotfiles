#!/bin/bash

# Pull a SeaMonkey profile from another host
# Usage: push-seamonkey.sh [-P <profile>] [user@]host

function fatal {
    echo "$@" 1>&2
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

[[ -h "$HOME/$profile_dir/lock" ]] && fatal "Profile $profile is running.  Exit SeaMonkey."

set -x
rsync -av --delete "$host:$profile_dir/" "$HOME/$profile_dir/"
