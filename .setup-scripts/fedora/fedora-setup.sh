#!/bin/bash

set -ex

echo "fastestmirror=true" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf
echo "installonly_limit=10" | sudo tee -a /etc/dnf/dnf.conf
echo "deltarpm=true" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf update -y

sudo dnf install dnf-plugin-system-upgrade -y
sudo dnf install -y flatpak -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf copr enable scottames/ghostty -y

sudo dnf install -y --skip-unavailable \
curl \
jq \
pavucontrol \
traceroute \
gnome-tweaks \
dconf-editor \
htop \
fzf \
zoxide \
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
dog \
langpacks-core-font-ja

sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
curl -fsSL https://tailscale.com/install.sh | sh
sudo chmod +x /usr/bin/yq

flatpak install flathub com.discordapp.Discord -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.spotify.Client -y


~/.setup-scripts/fedora/dnf/specific-apps/1pass.sh
~/.setup-scripts/fedora/dnf/specific-apps/vivaldi.sh
~/.setup-scripts/fedora/dnf/specific-apps/japanese.sh
~/.setup-scripts/fedora/dnf/specific-apps/steam.sh
~/.setup-scripts/fedora/dnf/specific-apps/eza.sh

~/.setup-scripts/fedora/dnf/specific-apps/vscode.sh
~/.setup-scripts/other-installs/vs-code-dracula.sh
~/.setup-scripts/other-installs/starship.sh


if command -v ghostty >/dev/null 2>&1; then
    sudo dnf remove ptyxis -y
fi

~/.setup-scripts/autostart-link.sh 1password.desktop




~/.setup-scripts/fedora/dnf/generic-install.sh
