#!/bin/bash -e

echo "###### install SDKMAN & Java"

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# install the latests LTS Java SDK
sdk install java
