#!/bin/bash

sudo add-apt-repository multiverse -y
sudo apt update && sudo apt upgrade 

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
htop \
xz-utils \
nemo \
libavcodec-extra \
vlc \
tlp \
tlp-rdw \
smartmontools \
vainfo \
ulauncher \
gnome-startup-applications \
exa \
bat \
ripgrep

sudo apt remove nautalis 

sudo flatpak install flathub com.todoist.Todoist -y
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install io.github.realmazharhussain.GdmSettings -y
sudo flatpak install flathub com.github.d4nj1.tlpui

sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
~/.setup-scripts/apt/droidcam.sh
~/.setup-scripts/apt/1pass.sh
~/.setup-scripts/apt/zoom.sh
~/.setup-scripts/apt/signal.sh
~/.setup-scripts/apt/exodus.sh
~/.setup-scripts/apt/ledger.sh
~/.setup-scripts/apt/steam.sh
~/.setup-scripts/apt/vivaldi.sh
~/.setup-scripts/apt/vscode.sh
~/.setup-scripts/apt/spotify.sh
~/.setup-scripts/apt/dbeaver.sh
~/.setup-scripts/apt/insomnia.sh
~/.setup-scripts/apt/rofi.sh
~/.setup-scripts/apt/nodejs.sh
~/.setup-scripts/apt/obsidian.sh
~/.setup-scripts/apt/alacrity.sh
~/.setup-scripts/apt/zoxide.sh
~/.setup-scripts/other-installs/starship.sh

## Wireguard auto pull conf and keys files
## terraform
## helm

## Nvidia drivers?
## wine/proton?
## Auto power change on charging
