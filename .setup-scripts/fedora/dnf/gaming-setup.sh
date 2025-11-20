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
~/.setup-scripts/scripts/autostart-link.sh es-de.desktop
~/.setup-scripts/scripts/autostart-link.sh org.gnome.World.PikaBackup.deskto
~/.setup-scripts/scripts/autostart-link.sh sol.desktop
~/.setup-scripts/scripts/autostart-link.sh steam.desktop
~/.setup-scripts/scripts/autostart-link.sh discord.desktop
~/.setup-scripts/scripts/autostart-link.sh sunshine.desktop

#Global Keyboard shortcuts
add_custom_keybinding "focus es-de" "/home/${USER}/.setup-scripts/scripts/focus_es-de.sh" "<Control><Shift><Alt><Super>space"
add_custom_keybinding "launch-spotify" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh" "<Control><Shift><Alt><Super>p"
add_custom_keybinding "music-next-track" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh next" "<Control><Shift><Alt><Super>s"
add_custom_keybinding "music-previous-track" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh previous" "<Control><Shift><Alt><Super>y"
add_custom_keybinding "msuic-volume-down" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh -" "<Control><Shift><Alt><Super>d"
add_custom_keybinding "music-volume-up" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh +" "<Control><Shift><Alt><Super>i"

~/.setup-scripts/other-installs/es-de.sh
