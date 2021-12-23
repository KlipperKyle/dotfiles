#!/bin/bash

if [ "$UID" -ne 0 ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

: "${D1:=/mnt/d1}"
: "${BACKUP:=/mnt/backup}"
: "${BACKUP_D1:=${BACKUP}/d1}"

B=$(basename "$0")

if ! mountpoint -q "$D1" ; then
    echo "$B: ERROR: Please mount d1 drive to ${D1} and try again." 1>&2
    exit 1
fi

if ! mountpoint -q "$BACKUP" ; then
    echo "$B: ERROR: Please mount backup drive to ${BACKUP} and try again." 1>&2
    exit 1
fi

echo "$B: Backing up ${D1}"
rsync -aAXHx --delete --info=progress2 \
      "${D1}/" "${BACKUP_D1}/" \
    || exit 1

echo "$B: Success!"
