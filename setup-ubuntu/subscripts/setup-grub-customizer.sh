#!/bin/bash -e

echo "###### install grub-customizer"

sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo aptitude update
sudo aptitude install grub-customizer
