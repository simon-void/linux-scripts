#!/bin/bash -e

#sudo apt install aptitude
#sudo aptitude install curl -y

#mkdir ~/progs
#mkdir ~/workspace/html
#mkdir ~/workspace/jvm
#mkdir ~/workspace/rust
#mkdir ~/workspace/scripts

#sudo aptitude install cpu-x -y
#sudo aptitude install gimp -y
#sudo aptitude install keepassxc -y
#sudo aptitude install thunderbird -y
#sudo aptitude install steam -y

#./subscripts/setup-firefox.sh
#./subscripts/setup-java.sh
#./subscripts/setup-rust.sh
#./subscripts/setup-intellij.sh
#./subscripts/setup-signal.sh
#./subscripts/setup-syncthing.sh
./subscripts/setup-freetube.sh
./subscripts/setup-vpn.sh

git config --global user.email "simon.void@gmx.de"
git config --global user.name "SSchroeder"
 
