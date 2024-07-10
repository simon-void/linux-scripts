#!/bin/bash -e

cd ~/progs
mkdir firefox
cd firefox

FIREFOX_ARCHIVE=firefox.tar.bz2

echo "downloading firefox"
curl -L -o $FIREFOX_ARCHIVE "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=sv-SE"
echo "extracting firefox"
tar -xvjf $FIREFOX_ARCHIVE --checkpoint=.100
rm -f $FIREFOX_ARCHIVE

FIREFOX_FOLDER=$(ls | head -n 1)

echo '
[Desktop Entry]
Comment=
Exec=/home/stephan/progs/firefox/'$FIREFOX_FOLDER'/firefox
Icon=/home/stephan/synced/pictures/icons/firefox-icon.png
Name=Firefox
NoDisplay=false
Path=
StartupNotify=true
Terminal=false
TerminalOptions=
Type=Application
X-KDE-SubstituteUID=false
X-KDE-Username=
' > ~/.local/share/applications/Firefox.desktop
