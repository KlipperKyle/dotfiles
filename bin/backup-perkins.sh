#!/bin/bash

if [ "$UID" -ne 0 ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

if ! mountpoint -q /mnt/backup ; then
    mount /mnt/backup || exit 1
    UMOUNT_BACKUP="true"
fi
if ! mountpoint -q /boot ; then
    mount -o ro /boot || exit 1
    UMOUNT_BOOT="true"
fi
if ! mountpoint -q /home ; then
    mount -o ro /home || exit 1
    UMOUNT_HOME="true"
fi
if ! mountpoint -q /mnt/alt ; then
    mount -o ro /mnt/alt || exit 1
    UMOUNT_ALT="true"
fi
if ! mountpoint -q /mnt/alt/boot ; then
    mount -o ro /mnt/alt/boot || exit 1
    UMOUNT_ALT_BOOT="true"
fi

echo "$0: Backing up /"
rsync -aAXHx --delete --info=progress2 \
      / /mnt/backup/perkins/ \
    || exit 1

echo "$0: Backing up /boot"
rsync -aAXHx --delete --info=progress2 \
      /boot/ /mnt/backup/perkins/boot/ \
    || exit 1

echo "$0: Backing up /home"
rsync -aAXHx --delete --info=progress2 \
      --exclude={"*/.cache","*/.ccache","*/.thumbnails","*/.gvfs"} \
      /home/ /mnt/backup/perkins/home/ \
    || exit 1

echo "$0: Backing up /mnt/alt"
rsync -aAXHx --delete --info=progress2 \
      /mnt/alt/ /mnt/backup/perkins/mnt/alt/ \
    || exit 1

echo "$0: Backing up /mnt/alt/boot"
rsync -aAXHx --delete --info=progress2 \
      /mnt/alt/boot/ /mnt/backup/perkins/mnt/alt/boot/ \
    || exit 1

[ -n "$UMOUNT_ALT_BOOT" ] && umount /mnt/alt/boot
[ -n "$UMOUNT_ALT" ] && umount /mnt/alt
[ -n "$UMOUNT_HOME" ] && umount /home
[ -n "$UMOUNT_BOOT" ] && umount /boot
[ -n "$UMOUNT_BACKUP" ] && umount /mnt/backup

echo "$0: End of script"
