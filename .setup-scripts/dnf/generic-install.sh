#!/bin/bash

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf copr enable scottames/ghostty -y

sudo dnf install -y --skip-unavailable \
curl \
jq \
pavucontrol \
traceroute \
gnome-tweaks \
dconf-editor \
htop \
lpf-spotify-client \
fzf \
zoxide \
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

# sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
# curl -fsSL https://tailscale.com/install.sh | sh
# sudo chmod +x /usr/bin/yq

# flatpak install flathub com.discordapp.Discord -y
# flatpak install flathub md.obsidian.Obsidian -y


# ~/.setup-scripts/dnf/specific-apps/1pass.sh
# ~/.setup-scripts/dnf/specific-apps/steam.sh
# ~/.setup-scripts/dnf/specific-apps/espanso.sh

# ~/.setup-scripts/dnf/specific-apps/vscode.sh
# ~/.setup-scripts/other-installs/starship.sh
# ~/.setup-scripts/other-installs/vs-code-dracula.sh
