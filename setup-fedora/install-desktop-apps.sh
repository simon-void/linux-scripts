#!/bin/bash -e

# REPLACE blueframe with current computer's new name (since that's not part of the installer)
#sudo hostnamectl set-hostname blueframe

# see https://www.youtube.com/watch?v=nXUbnfMz65w
# enable "all of flathub"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# enable RPM fushion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# multimedia codecs
sudo dnf install libavcodec-freeworld -y


sudo dnf install curl -y

mkdir -p ~/progs
mkdir -p ~/synced
mkdir -p ~/workspace/html
mkdir -p ~/workspace/jvm
mkdir -p ~/workspace/rust
mkdir -p ~/workspace/scripts

sudo dnf install chromium -y
sudo dnf install cpu-x -y
sudo flatpak install FreeTube io.freetubeapp.FreeTube -y
sudo dnf install gimp -y
sudo dnf install keepassxc -y
sudo dnf install thunderbird -y
sudo flatpak install Steam com.valvesoftware.Steam -y

./subscripts/setup-git.sh
./subscripts/setup-java.sh
./subscripts/setup-rust.sh
./subscripts/prepare-intellij.sh
#./subscripts/setup-firefox.sh
#./subscripts/setup-signal.sh
#./subscripts/setup-syncthing.sh
#./subscripts/setup-vpn.sh


 
