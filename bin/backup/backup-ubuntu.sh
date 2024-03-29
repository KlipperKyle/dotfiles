#!/bin/bash

if [ "$UID" -ne 0 ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

: "${HOSTNAME:=$(uname -n)}"
: "${BACKUP:=/mnt/backup}"
: "${BACKUP_ROOT:=${BACKUP}/${HOSTNAME}}"

B=$(basename "$0")

if ! mountpoint -q "$BACKUP" ; then
    echo "$B: ERROR: Please mount backup drive to ${BACKUP} and try again." 1>&2
    exit 1
fi

[ -d "$BACKUP_ROOT" ] || mkdir -p "$BACKUP_ROOT" || exit 1
[ -d "${BACKUP_ROOT}/meta" ] || mkdir -p "${BACKUP_ROOT}/meta" || exit 1

STAMP="$(date +%Y%m%d-%H%M%S)"
apt-mark showmanual | bzip2 -c > "${BACKUP_ROOT}/meta/apt-manual.${STAMP}.bz2" || exit 1
apt-mark showhold | bzip2 -c > "${BACKUP_ROOT}/meta/apt-hold.${STAMP}.bz2" || exit 1
dpkg -l | bzip2 -c > "${BACKUP_ROOT}/meta/dpkg-l.${STAMP}.bz2" || exit 1
snap list --all | bzip2 -c > "${BACKUP_ROOT}/meta/snap-list.${STAMP}.bz2" || exit 1

echo "$B: Backing up /etc"
rsync -aAXHx --delete --info=progress2 \
      /etc/ "${BACKUP_ROOT}/etc/" \
    || exit 1

echo "$B: Backing up /boot"
rsync -aAXH --delete --info=progress2 \
      /boot/ "${BACKUP_ROOT}/boot/" \
    || exit 1

echo "$B: Backing up /root"
rsync -aAXHx --delete --info=progress2 \
      /root/ "${BACKUP_ROOT}/root/" \
    || exit 1

echo "$B: Backing up /home"
rsync -aAXHx --delete --info=progress2 \
      --exclude={"*/.cache","*/.ccache","*/.thumbnails","*/.gvfs"} \
      /home/ "${BACKUP_ROOT}/home/" \
    || exit 1

echo "$B: Backing up /usr/local"
[ -d "${BACKUP_ROOT}/usr/local" ] || mkdir -p "${BACKUP_ROOT}/usr/local" || exit 1
rsync -aAXHx --delete --info=progress2 \
      /usr/local/ "${BACKUP_ROOT}/usr/local/" \
    || exit 1

echo "$B: Success!"
