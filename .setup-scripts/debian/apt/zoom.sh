#!/bin/bash

wget -O package-signing-key.pub https://zoom.us/linux/download/pubkey
gpg --show-keys package-signing-key.pub
sudo gpg --import package-signing-key.pub

wget https://zoom.us/client/latest/zoom_amd64.deb
sudo nala install -y ./zoom_amd64.deb

rm zoom_amd64.deb package-signing-key.pub