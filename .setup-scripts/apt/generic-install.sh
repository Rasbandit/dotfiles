#!/bin/bash

sudo add-apt-repository multiverse
sudo apt update&& sudo apt upgrade && sudo apt upgrade


sudo apt install -y \
curl \
default-jdk \
jq \
yq \
pavucontrol

sudo snap refresh
sudo snap install todoist vlc
sudo snap set core experimental.refresh-app-awareness=true

~/.setup-scripts/other-installs/nordvpn.sh
~/.setup-scripts/other-installs/droidcam.sh
~/.setup-scripts/apt/zoom.sh
~/.setup-scripts/apt/signal.sh
~/.setup-scripts/apt/exodus.sh
~/.setup-scripts/apt/ledger.sh
~/.setup-scripts/apt/steam.sh
~/.setup-scripts/apt/discord.sh

## INSOMNIA/postman
## Wireguard
## terraform
## helm

## Nvidia drivers?
## wine/proton?