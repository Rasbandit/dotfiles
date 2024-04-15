#!/bin/bash

sudo apt install software-properties-common
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher

wget -q -O - https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/add_udev_rules.sh | sudo bash

sudo add-apt-repository universe
sudo apt install libfuse2

wget -O ~/Documents/ledger-live-desktop.AppImage https://download.live.ledger.com/latest/linux

chmod +x ~/Documents/ledger-live-desktop.AppImage