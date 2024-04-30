#!/bin/bash

# Add Repositories
sudo add-apt-repository multiverse -y
~/.setup-scripts/apt/1pass.sh
~/.setup-scripts/apt/dbeaver.sh
~/.setup-scripts/apt/insomnia.sh
~/.setup-scripts/apt/signal.sh
~/.setup-scripts/apt/spotify.sh

sudo nala update

sudo nala install -y \
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
ripgrep \
btop \
gedit \
flatpak \
1password-cli \
1password \
default-jdk \
dbeaver-ce \
"linux-headers-$(uname -r)" \
gcc \
make \
adb \
insomnia \
lens \
install \
qemu-kvm \
qemu-system \
qemu-utils \
python3 \
python3-pip \
libvirt-clients \
libvirt-daemon-system \
bridge-utils \
virtinst \
libvirt-daemon \
virt-manager \
signal-desktop \
spotify-client \
steam \
tailscale

sudo nala remove nautalis

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub com.todoist.Todoist -y
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install io.github.realmazharhussain.GdmSettings -y
sudo flatpak install flathub com.github.d4nj1.tlpui

sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
~/.setup-scripts/apt/droidcam.sh
~/.setup-scripts/apt/zoom.sh
~/.setup-scripts/apt/exodus.sh
~/.setup-scripts/apt/ledger.sh
~/.setup-scripts/apt/steam.sh
~/.setup-scripts/apt/vivaldi.sh
~/.setup-scripts/apt/vscode.sh
~/.setup-scripts/apt/nodejs.sh
~/.setup-scripts/apt/obsidian.sh
~/.setup-scripts/apt/alacrity.sh
~/.setup-scripts/apt/zoxide.sh
~/.setup-scripts/apt/qumu.sh
~/.setup-scripts/other-installs/starship.sh

## Wireguard auto pull conf and keys files
## terraform
## helm

## Nvidia drivers?
## wine/proton?
## Auto power change on charging
