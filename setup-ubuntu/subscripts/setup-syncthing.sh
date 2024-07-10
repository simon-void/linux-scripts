#!/bin/bash -e

echo "###### install syncthing"

# Setting up Syncthing on an ubuntu machine using systemd.
# Info compiled from https://computingforgeeks.com/how-to-install-and-use-syncthing-on-ubuntu/

# install syncthing
sudo aptitude install apt-transport-https
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo aptitude update
sudo aptitude install syncthing
syncthing --version

# setup syncthing as a service started automatically at system start

echo '
[Unit]
Description=Syncthing - Open Source Continuous File Synchronization for %I
Documentation=man:syncthing(1)
After=network.target

[Service]
User=%i
ExecStart=/usr/bin/syncthing -no-browser -gui-address="0.0.0.0:8384" -no-restart -logflags=0
Restart=on-failure
SuccessExitStatus=3 4
RestartForceExitStatus=3 4

[Install]
WantedBy=multi-user.target
' | sudo tee /etc/systemd/system/syncthing@.service

sudo systemctl daemon-reload

sudo systemctl enable syncthing@$USER
sudo systemctl start syncthing@$USER

#open syncthing admin-UI in browser

echo "opening syncthing admin-UI"
echo "first setup a username and password, as should be prompted on the page, also enable 'Use HTTPS for GUI'"
xdg-open https://localhost:8384/#

# show syncthing status

sudo systemctl status syncthing@$USER

