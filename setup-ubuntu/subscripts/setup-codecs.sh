#!/bin/bash -e

echo "###### install codecs as part of restricted extras"

sudo add-apt-repository multiverse
sudo aptitude update
sudo aptitude install kubuntu-restricted-extras -y
