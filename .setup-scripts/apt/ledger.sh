#!/bin/bash

wget -q -O - https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/add_udev_rules.sh | sudo bash

wget -O ~/Documents/ledger-live-desktop.AppImage https://download.live.ledger.com/latest/linux

chmod +x ~/Documents/ledger-live-desktop.AppImage