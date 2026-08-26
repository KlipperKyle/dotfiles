#!/bin/bash
set -e
set -x

# GTK
# ./configure --with-libsystemd --with-pop=yes --with-sound=alsa --without-gconf --with-mailutils --with-native-compilation --with-cairo --with-x=yes --with-x-toolkit=gtk3 --without-toolkit-scroll-bars

# Lucid (minimal) toolkit
./configure --with-libsystemd --with-pop=yes --with-sound=alsa --without-gconf --with-mailutils --with-native-compilation --with-x=yes --with-x-toolkit=lucid --without-toolkit-scroll-bars --without-gsettings

# Motif
# ./configure --with-libsystemd --with-pop=yes --with-sound=alsa --without-gconf --with-mailutils --with-native-compilation --with-x=yes --with-x-toolkit=motif --without-toolkit-scroll-bars --without-gsettings

make -j$(nproc)
make check -j$(nproc)
