#!/bin/bash

if [ "$UID" -ne 0 ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

rsync -aAXHS \
    --exclude={"/d1/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.cache/*","/home/*/.ccache/*","/home/*/.thumbnails/*","/home/*/.gvfs"} \
    --delete \
    --info=progress2 \
    / /mnt/backup/landru/
