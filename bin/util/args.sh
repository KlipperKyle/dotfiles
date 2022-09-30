#!/bin/sh

for v in ${1+"$@"} ; do
    echo "‘$v’"
done
