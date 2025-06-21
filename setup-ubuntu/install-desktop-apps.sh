#!/bin/bash -e

sudo apt install aptitude -y
sudo aptitude install curl -y

mkdir -p ~/progs
mkdir -p ~/synced
mkdir -p ~/workspace/html
mkdir -p ~/workspace/jvm
mkdir -p ~/workspace/rust
mkdir -p ~/workspace/scripts

sudo snap install chromium
sudo aptitude install cpu-x -y
sudo snap install freetube
sudo aptitude install gimp -y
sudo aptitude install keepassxc -y
sudo aptitude install thunderbird -y
sudo aptitude install steam -y

./subscripts/setup-git.sh
./subscripts/setup-java.sh
./subscripts/setup-rust.sh
./subscripts/setup-firefox.sh
./subscripts/setup-signal.sh
#./subscripts/setup-syncthing.sh
./subscripts/setup-codecs.sh
./subscripts/setup-vpn.sh
./subscripts/setup-grub-customizer.sh

 
