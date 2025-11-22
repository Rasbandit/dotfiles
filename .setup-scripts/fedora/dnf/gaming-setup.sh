#!/bin/bash

source ~/.setup-scripts/desktop-environments/add_custom_keybinding.sh

sudo dnf copr enable lizardbyte/stable -y
sudo dnf copr enable lizardbyte/beta -y

sudo dnf upgrade --refresh -y

sudo dnf install --skip-broken -y \
timeshift \
seahorse \
dolphin-emu \
steam \
retroarch \
Sunshine \
xdotool \
gamescope \
goverlay \
lutris \
input-remapper \
wmctrl \
playerctl

sudo dnf upgrade --refresh -y

sudo systemctl enable --now input-remapper

#Proton
flatpak install flathub net.davidotek.pupgui2 -y
flatpak install flathub com.vysp3r.ProtonPlus -y
sudo flatpak install org.gnome.World.PikaBackup -y

#Auto Starts
~/.setup-scripts/scripts/autostart-link.sh link es-de.desktop
~/.setup-scripts/scripts/autostart-link.sh link steam.desktop

#Global Keyboard shortcuts
add_custom_keybinding "focus es-de" "${HOME}/.setup-scripts/scripts/focus_es-de.sh" "<Control><Shift><Alt><Super>space"
add_custom_keybinding "launch-spotify" "${HOME}/.setup-scripts/scripts/spotify-controll.sh" "<Control><Shift><Alt><Super>p"
add_custom_keybinding "music-next-track" "${HOME}/.setup-scripts/scripts/spotify-controll.sh next" "<Control><Shift><Alt><Super>s"
add_custom_keybinding "music-previous-track" "${HOME}/.setup-scripts/scripts/spotify-controll.sh previous" "<Control><Shift><Alt><Super>y"
add_custom_keybinding "msuic-volume-down" "${HOME}/.setup-scripts/scripts/spotify-controll.sh -" "<Control><Shift><Alt><Super>d"
add_custom_keybinding "music-volume-up" "${HOME}/.setup-scripts/scripts/spotify-controll.sh +" "<Control><Shift><Alt><Super>i"

~/.setup-scripts/other-installs/es-de.sh
~/.setup-scripts/fedora/dnf/specific-apps/xbox-dongle.sh
~/.setup-scripts/fedora/dnf/specific-apps/xpad-noone.sh


mkdir -p "${HOME}/Documents/local_steam"
echo "${HOME}/Documents/local_steam   ${HOME}/ES-DE/roms/steam    none    bind,nofail    0   0" | sudo tee -a /etc/fstab

echo "Do you want Mobile or Stationary Setup:"
echo "Choose an installation type:"
echo "1) Mobile Setup"
echo "2) Stationary Laptop"
echo ""

read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        echo "Running Mobile Gaming Setup installation..."
        ~/.setup-scripts/fedora/dnf/gaming-setup-mobile.sh
        ;;
    2)
        echo "Running Stationary Gaming Setup installation..."
        ~/.setup-scripts/fedora/dnf/gaming-setup-stationary.sh
        ;;
    *)
        echo "Invalid choice. Please run the script again and select 1 or 2."
        exit 1
        ;;
esac