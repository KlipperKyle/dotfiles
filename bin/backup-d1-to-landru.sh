#!/bin/bash

if [ "$UID" -ne 0 ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

if mountpoint -q /mnt/d1 ; then
    echo "$0: Backing up /mnt/d1"
    rsync -aAXHx --delete --info=progress2 \
	  /mnt/d1/ root@landru:/d1/ \
	|| exit 1
else
    echo "$0: ERROR: /mnt/d1 is not mounted.  Cannot backup." 1>&2
    exit 1
fi
