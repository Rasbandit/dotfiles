#!/bin/bash

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
dnf copr enable pgdev/ghostty -y

sudo dnf install -y \
curl \
jq \
pavucontrol \
wireguard-tools \
traceroute \
gnome-tweaks \
dconf-editor \
htop \
lpf-spotify-client \
fzf \
zoxide \
exa \
eza \
pip3 \
nodejs \
rust \
cargo \
ripgrep \
ghostty \
bat \
btop \
fastfetch \
colordiff \
duf \
fd \
iotop \
dog

sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
curl -fsSL https://tailscale.com/install.sh | sh
sudo chmod +x /usr/bin/yq

flatpak install flathub com.todoist.Todoist -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.signal.Signal -y
flatpak install flathub md.obsidian.Obsidian -y

~/.setup-scripts/other-installs/droidcam.sh
~/.setup-scripts/dnf/1pass.sh
~/.setup-scripts/dnf/steam.sh
~/.setup-scripts/dnf/espanso.sh
~/.setup-scripts/dnf/lazy-docker.sh

# ~/.setup-scripts/dnf/exodus.sh
# ~/.setup-scripts/dnf/ledger.sh
~/.setup-scripts/dnf/vscode.sh
~/.setup-scripts/dnf/dbeaver.sh
~/.setup-scripts/other-installs/starship.sh
~/.setup-scripts/other-installs/vs-code-dracula.sh

## INSOMNIA/postman
## Wireguard auto pull conf and keys files
## terraform
## helm

## Nvidia drivers?
## wine/proton?
## Auto power change on charging
