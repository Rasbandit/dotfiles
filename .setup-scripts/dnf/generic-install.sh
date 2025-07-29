#!/bin/bash

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf copr enable scottames/ghostty -y

sudo dnf install -y -f --skip-unavailable \
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


~/.setup-scripts/dnf/specific-apps/1pass.sh
~/.setup-scripts/dnf/specific-apps/japanese.sh
~/.setup-scripts/dnf/specific-apps/steam.sh
~/.setup-scripts/dnf/specific-apps/eza.sh

~/.setup-scripts/dnf/specific-apps/vscode.sh
~/.setup-scripts/other-installs/vs-code-dracula.sh
~/.setup-scripts/other-installs/starship.sh


if command -v ghostty >/dev/null 2>&1; then
    # Replace the following line with the command you want to run
    sudo dnf remove ptyxis
fi

~/.setup-scripts/autostart-link.sh 1password.desktop
