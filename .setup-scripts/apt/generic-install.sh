#!/bin/bash

sudo add-apt-repository multiverse
sudo apt update&& sudo apt upgrade && sudo apt upgrade


sudo apt install -y \
curl \
default-jdk \
jq \
yq \
vlc \
pavucontrol

sudo snap refresh
sudo snap install discord todoist zoom-client
sudo snap set core experimental.refresh-app-awareness=true

~/.setup-scripts/other-installs/nordvpn.sh
~/.setup-scripts/other-installs/droidcam.sh

## INSOMNIA/postman
## Wireguard
## droidcam
## terraform
## helm
## tailscale
## steam

## Nvidia drivers?
## wine/proton?
## Readme
## Ledger