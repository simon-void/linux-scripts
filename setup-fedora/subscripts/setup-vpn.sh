#!/bin/bash -e

echo "###### install mullvad"

# Fedora 41 and newer
# Add the Mullvad repository server to dnf
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# Fedora 40 and earlier
# Add the Mullvad repository server to dnf
sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo

# Install the package
sudo dnf install mullvad-vpn
