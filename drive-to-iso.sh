#!/bin/bash

# uses dd command to rip a drive to an iso file

if [ $# -ne 2 ]
then
# print help that 2 args have to be provided
echo "please provide 2 parameter"
echo "e.g. ./drive-to-iso.sh /dev/sr0 filename"
echo "with"
echo "1st param: absolute path to drive. you can find the path to the drive by checking the properties of the mounted drive e.g. in Dolphin"
echo "2nd param: absolute or relative path to the new output file. .iso file ending will be appended"
else
dd if="$1" of="$2.iso"
echo "created file $2.iso"
fi
