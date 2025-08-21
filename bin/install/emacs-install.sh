#!/bin/bash
set -e
set -x

d="/usr/local/stow/emacs-30.2-gtk1"

make install "prefix=$d"
cd "$d/bin"
mv -v ctags ctags-emacs
mv -v etags etags-emacs
cd ../share/man/man1
mv -v ctags.1.gz ctags-emacs.1.gz
mv -v etags.1.gz etags-emacs.1.gz
echo '.so man1/etags-emacs.1' | gzip -c | tee ctags-emacs.1.gz > /dev/null
cd
sudo chown -R root:root "$d"
