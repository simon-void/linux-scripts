#!/bin/bash -e

echo "###### install IntelliJ"

cd ~/progs
mkdir -p intellij
cd intellij

latest_version=$(curl -s https://www.jetbrains.com/updates/updates.xml | awk 'match($0,/version="[^"]*/){print substr($0,RSTART+9,RLENGTH-9)}' | head -1)

intellij_file_name="ideaIU-$latest_version.tar.gz"
download_link="https://download-cdn.jetbrains.com/idea/$intellij_file_name"

echo "downloading latest IntelliJ from: $download_link"
echo "TODO: find a correct way to download the latest version of intellij"

# download latest IntelliJ
#curl $download_link --output $intellij_file_name
# extract latest IntelliJ to current directory
#tar -zxvf $intellij_file_name

echo '
#! /bin/bash

~/progs/intellij/idea-IU-$latest_version/bin/idea
' > start_intellij.sh