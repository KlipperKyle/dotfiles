#!/bin/bash

cd /
if [ "$UID" -ne 0 ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

if ! mountpoint -q /boot ; then
    mount -o ro /boot || exit 1
    UMOUNT_BOOT="true"
fi
if ! mountpoint -q /mnt/alt ; then
    mount /mnt/alt || exit 1
    UMOUNT_ALT="true"
fi
if ! mountpoint -q /mnt/alt/boot ; then
    mount /mnt/alt/boot || exit 1
    UMOUNT_ALT_BOOT="true"
fi

# Backup the filesystems
echo "$0: Backing up /"
rsync -aHAXx --delete --info=progress2 / /mnt/alt/ || exit 1
echo "$0: Backing up /boot"
rsync -aHAXx --delete --info=progress2 /boot/ /mnt/alt/boot/ || exit 1

# Prepare the script to run within the chroot
cat > /mnt/alt/prepme <<'EOF'
#!/bin/bash

# Get the drive letter of the drive to which to install the bootloader.
TARGETDRIVE="$(readlink -f /dev/disk/by-label/rootalt)"
TARGETDRIVE="${TARGETDRIVE%%[[:digit:]]}"
if [ ! -e "$TARGETDRIVE" ] ; then
    echo "$0: Target drive $TARGETDRIVE does not exist." >&2
    exit 1
fi

echo "$0: installing Grub to $TARGETDRIVE"
grub-install --target=i386-pc --no-floppy $TARGETDRIVE || exit 1

echo "$0: Swapping root, rootalt, and friends in /etc/fstab"
sed -i.bak -e '
	s/^LABEL=boot\b/LABEL=bootalt/
	s/^LABEL=swap\b/LABEL=swapalt/
	s/^LABEL=root\b/LABEL=rootalt/
	t
	s/^LABEL=bootalt\b/LABEL=boot/
	s/^LABEL=swapalt\b/LABEL=swap/
	s/^LABEL=rootalt\b/LABEL=root/
	' /etc/fstab || exit 1

echo "$0: boot-update"
boot-update || exit 1

rm /prepme

EOF

# chroot and update the bootloader and fstab
echo "$0: chroot'ing and running 'prepme'..."
cd /mnt/alt || exit 1
mount -t proc none proc || exit 1
mount --rbind /sys sys || exit 1
mount --rbind /dev dev || exit 1
env -i HOME=/root TERM=$TERM /bin/chroot . sh /prepme || exit 1

echo "$0: sync'ing disks..."
sync

# Clean up
echo "$0: Done!  Cleaning up..."
cd /
umount -R /mnt/alt/dev
umount -R /mnt/alt/sys
umount -R /mnt/alt/proc

[ -n "$UMOUNT_ALT_BOOT" ] && umount /mnt/alt/boot
[ -n "$UMOUNT_ALT" ] && umount /mnt/alt
[ -n "$UMOUNT_BOOT" ] && umount /boot

echo "$0: All clean.  :-)"
