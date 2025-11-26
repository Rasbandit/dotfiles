#!/bin/bash

source ~/.setup-scripts/desktop-environments/add_custom_keybinding.sh

sudo dnf copr enable lizardbyte/stable -y
sudo dnf copr enable lizardbyte/beta -y

sudo dnf upgrade --refresh -y

sudo dnf install --skip-broken -y \
timeshift \
seahorse \
steam \
Sunshine \
xdotool \
gamescope \
goverlay \
lutris \
wmctrl \
playerctl

sudo dnf upgrade --refresh -y

#Proton
sudo latpak install flathub net.davidotek.pupgui2 -y
sudo flatpak install flathub com.vysp3r.ProtonPlus -y
sudo flatpak install org.gnome.World.PikaBackup -y
sudo flatpak install flathub org.DolphinEmu.dolphin-emu -y
sudo flatpak install flathub org.libretro.RetroArch -y
sudo flatpak install app.xemu.xemu -y

# Udev to ignore keycrhon
echo 'KERNEL=="event*", SUBSYSTEM=="input", ENV{ID_VENDOR_ID}=="3434", ENV{ID_INPUT_JOYSTICK}=="*?", ENV{ID_INPUT_JOYSTICK}="""' | sudo tee /etc/udev/rules.d/99-keychron-no-joysticks.rules >/dev/null 
sudo udevadm control --reload-rules && sudo udevadm trigger --subsystem-match=input

#Auto Starts
~/.setup-scripts/scripts/autostart-link.sh link es-de.desktop
~/.setup-scripts/scripts/autostart-link.sh link steam.desktop
~/.setup-scripts/scripts/autostart-link.sh link evmapy.desktop

~/.setup-scripts/other-installs/es-de.sh
~/.setup-scripts/other-installs/evmap.sh
~/.setup-scripts/other-installs/ryujinx.sh
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