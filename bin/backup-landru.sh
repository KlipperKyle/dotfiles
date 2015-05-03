#!/bin/bash

if [ "$UID" -ne 0 ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

rsync -aAXv \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/srv/*","/lost+found","/backup/*","/home/*/.cache/*","/home/*/.ccache/*","/home/*/.thumbnails/*","/home/*/.gvfs"} \
    --delete \
    / /backup/landru/
