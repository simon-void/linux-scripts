#!/bin/bash -e

mkdir -p ~/progs/intellij

echo '#!/bin/bash -e

~/progs/intellij/idea-IU-xxx.xxxx.xxx/bin/idea
' > ~/progs/intellij/start-intellij.sh

chmod +x ~/progs/intellij/start-intellij.sh

mkdir -p ~/.local/share/applications
cd ~

echo "[Desktop Entry]
Comment=
Exec=$(pwd)/progs/intellij/start-intellij.sh
Icon=$(pwd)/synced/pictures/icons/intellij-idea.png
Name=IntelliJ
NoDisplay=false
Path=
StartupNotify=true
Terminal=false
TerminalOptions=
Type=Application
X-KDE-SubstituteUID=false
X-KDE-Username=
" > ~/.local/share/applications/IntelliJ.desktop
