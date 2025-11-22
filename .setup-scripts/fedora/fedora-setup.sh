#!/bin/bash

set -ex

echo "fastestmirror=true" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf
echo "installonly_limit=10" | sudo tee -a /etc/dnf/dnf.conf
echo "deltarpm=true" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf update -y

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
langpacks-core-font-ja \
flatpak \
dnf-plugin-system-upgrade

curl -fsSL https://tailscale.com/install.sh | sh

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.discordapp.Discord -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.spotify.Client -y

~/.setup-scripts/fedora/dnf/specific-apps/1pass.sh
~/.setup-scripts/fedora/dnf/specific-apps/vivaldi.sh
~/.setup-scripts/fedora/dnf/specific-apps/japanese.sh
~/.setup-scripts/fedora/dnf/specific-apps/steam.sh
~/.setup-scripts/fedora/dnf/specific-apps/eza.sh
~/.setup-scripts/fedora/dnf/specific-apps/yq.sh

~/.setup-scripts/fedora/dnf/specific-apps/vscode.sh
~/.setup-scripts/other-installs/vs-code-dracula.sh
~/.setup-scripts/other-installs/starship.sh

if command -v ghostty >/dev/null 2>&1; then
    sudo dnf remove ptyxis -y
fi

~/.setup-scripts/scripts/autostart-link.sh link 1password.desktop

echo "We are currently installing a fedora system. Please choose an installation type:"
echo "Choose an installation type:"
echo "1) Gaming Setup"
echo "2) Personal Laptop"
echo ""

read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        echo "Running Gaming Setup installation..."
        ~/.setup-scripts/fedora/dnf/gaming-setup.sh
        ;;
    2)
        echo "Running Personal Laptop installation..."
        ~/.setup-scripts/fedora/dnf/laptop-install.sh
        ;;
    *)
        echo "Invalid choice. Please run the script again and select 1 or 2."
        exit 1
        ;;
esac