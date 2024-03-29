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
sudo snap install discord todoist
sudo snap set core experimental.refresh-app-awareness=true

~/.setup-scripts/other-installs/nordvpn.sh
~/.setup-scripts/other-installs/droidcam.sh
~/.setup-scripts/apt/zoom.sh
~/.setup-scripts/apt/signal.sh
~/.setup-scripts/apt/exodus.sh
~/.setup-scripts/apt/ledger.sh

## INSOMNIA/postman
## Wireguard
## terraform
## helm
## steam

## Nvidia drivers?
## wine/proton?
## Readme
## Ledger