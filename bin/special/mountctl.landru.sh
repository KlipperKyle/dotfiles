#!/bin/bash
# mountctl

MOUNTPOINTS=( /mnt/landru/d1 /mnt/landru/home )

HELP='Usage: mountctl (mount|umount|unmount|ro|rw)

Control and manipulate these mountpoints as a batch operation:

'"${MOUNTPOINTS[@]}"'
'

action="$1"
case "$action" in
    mount)
	cond='! mountpoint -q'
	action='mount'
	;;
    umount|unmount)
	cond='mountpoint -q'
	action='umount'
	;;
    ro)
	cond='mountpoint -q'
	action='mount -o remount,ro'
	;;
    rw)
	cond='mountpoint -q'
	action='mount -o remount,rw'
	;;
    help|-h|--help|'')
	echo "$HELP" 1>&2
	exit 1
	;;
    *)
	echo -e "$0: Unknown action '$action'" 1>&2
	exit 1
	;;
esac

if [ "$EUID" != 0 ] ; then
    echo "$0: Must be root!" 1>&2
    exit 1
fi

for p in "${MOUNTPOINTS[@]}" ; do
    if eval $cond "$p" ; then
	echo + $action "$p"
	eval $action "$p"
    fi
done
