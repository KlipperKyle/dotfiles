#!/bin/bash
set -e
set -x

d="/usr/local/stow/emacs-31.1-deb13+lucid1"

if [[ -e "$d" ]] ; then
    echo "Cowardly refusing to overwrite directory $d" >&2
    exit 1
fi

make install "prefix=$d"
cd "$d/bin"
if [ -e ctags ] ; then
    mv -v ctags ctags-emacs
fi
if [ -e etags ] ; then
    mv -v etags etags-emacs
fi
cd ../share/man/man1
if [ -e ctags.1.gz ] ; then
    mv -v ctags.1.gz ctags-emacs.1.gz
    echo '.so man1/etags-emacs.1' | gzip -c | tee ctags-emacs.1.gz > /dev/null
fi
if [ -e etags.1.gz ] ; then
    mv -v etags.1.gz etags-emacs.1.gz
fi
cd
sudo chown -R root:root "$d"
