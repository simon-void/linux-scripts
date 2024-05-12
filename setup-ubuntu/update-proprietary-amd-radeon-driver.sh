#!/bin/bash

# first manually download and install the Radeon driver from: https://www.amd.com/en/support/linux-drivers
# more background from this stackoverflow thread: https://askubuntu.com/questions/1486710/boot-fails-with-amdgpu-fatal-error-during-gpu-init-after-switching-graphics-c/1486798?noredirect=1#comment2603940_1486798

if [ $# -ne 0 ]
then
# print help that 2 args have to be provided
echo 'provided parameter(s) are ignored'
fi

if ! command -v amdgpu-install &> /dev/null
then
    echo 'amdgpu-install has not been installed, yet!'
    echo 'Please install latest Radeon driver from: https://www.amd.com/en/support/linux-drivers , then repeat'
    exit 1
fi

echo 'latest proprietary Radeon drivers for OpenCL and Vulkan will be installed'

amdgpu-install --opencl=rocr --vulkan=pro -y --accept-eula || die 'OpenCL/Vulkan driver update failed.'

die() {
    local message=$1

    echo "$message" >&2
    exit 1
}