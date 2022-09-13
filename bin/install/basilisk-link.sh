#!/bin/sh
#
# basilisk-link.sh
#
# Run this as root.
# Assumption: you have already extracted the Basilisk build to /opt
# <https://www.basilisk-browser.org/download.shtml>
# <http://linux.palemoon.org/download/mainline/>
# <http://linux.palemoon.org/help/installation/>

if [ "$USER" != "root" ] ; then
    echo "$0: Must run as root" >&2
    exit 1
fi

# Binary
ln -s /opt/basilisk/basilisk /usr/local/bin/basilisk

# Icons
mkdir -p /usr/local/share/icons/hicolor/16x16/apps/
mkdir -p /usr/local/share/icons/hicolor/32x32/apps/
mkdir -p /usr/local/share/icons/hicolor/48x48/apps/
mkdir -p /usr/local/share/icons/hicolor/128x128/apps/
ln -s /opt/basilisk/browser/chrome/icons/default/default16.png /usr/local/share/icons/hicolor/16x16/apps/basilisk.png
ln -s /opt/basilisk/browser/chrome/icons/default/default32.png /usr/local/share/icons/hicolor/32x32/apps/basilisk.png
ln -s /opt/basilisk/browser/chrome/icons/default/default48.png /usr/local/share/icons/hicolor/48x48/apps/basilisk.png
ln -s /opt/basilisk/browser/icons/mozicon128.png /usr/local/share/icons/hicolor/128x128/apps/basilisk.png

# Desktop file
[ -d /usr/local/share/applications/ ] || mkdir -p /usr/local/share/applications/
cat > /usr/local/share/applications/basilisk.desktop << 'EOF'
[Desktop Entry]
Version=1.0
Name=Basilisk Web Browser
Comment=Browse the World Wide Web
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=basilisk %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=basilisk
Categories=Network;WebBrowser;Internet
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
EOF

# Refresh app list
#update-desktop-database -q
#gtk-update-icon-cache -q -t /usr/local/share/icons/hicolor

echo "Links created"
echo "For more info: <http://linux.palemoon.org/help/installation/>"
