#!/bin/bash

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo

sudo dnf install -y \
curl \
jq \
pavucontrol \
wireguard-tools \
traceroute \
gnome-tweaks \
dconf-editor \
htop \
vivaldi-stable \
lpf-spotify-client \
fzf \
zoxide \
starship \
exa \
eza

sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
sudo chmod +x /usr/bin/yq

flatpak install flathub com.todoist.Todoist -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.signal.Signal -y

sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
~/.setup-scripts/other-installs/droidcam.sh
~/.setup-scripts/dnf/1pass.sh
~/.setup-scripts/dnf/zoom.sh
# ~/.setup-scripts/dnf/exodus.sh
# ~/.setup-scripts/dnf/ledger.sh
# ~/.setup-scripts/dnf/steam.sh
# ~/.setup-scripts/dnf/discord.sh
# ~/.setup-scripts/dnf/vivaldi.sh
# ~/.setup-scripts/dnf/vscode.sh
# ~/.setup-scripts/dnf/spotify.sh
# ~/.setup-scripts/dnf/dbeaver.sh
# ~/.setup-scripts/other-installs/starship.sh

## INSOMNIA/postman
## Wireguard auto pull conf and keys files
## terraform
## helm

## Nvidia drivers?
## wine/proton?
## Auto power change on charging
