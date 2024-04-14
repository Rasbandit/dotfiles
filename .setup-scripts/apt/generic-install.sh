#!/bin/bash

sudo add-apt-repository multiverse
sudo apt update&& sudo apt upgrade && sudo apt upgrade

sudo apt install -y \
curl \
default-jdk \
jq \
yq \
pavucontrol \
wireguard \
traceroute \
gnome-tweaks \
dconf-editor \
htop

flatpak install flathub com.todoist.Todoist -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.discordapp.Discord -y

~/.setup-scripts/other-installs/nordvpn.sh
~/.setup-scripts/other-installs/droidcam.sh
~/.setup-scripts/apt/zoom.sh
~/.setup-scripts/apt/signal.sh
~/.setup-scripts/apt/exodus.sh
~/.setup-scripts/apt/ledger.sh
~/.setup-scripts/apt/steam.sh
~/.setup-scripts/apt/discord.sh

## INSOMNIA/postman
## Wireguard auto pull conf and keys files
## terraform
## helm

## Nvidia drivers?
## wine/proton?
## Auto power change on charging
