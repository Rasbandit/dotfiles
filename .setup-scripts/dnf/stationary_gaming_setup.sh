#! /bin/bash

source ~/.setup-scripts/desktop-environments/add_custom_keybinding.sh

cd /home/rasbandit/Downloads

echo "10.0.20.214:/mnt/user/gaming-desktop-backup    /mnt/backup    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/user/es-de/roms    /home/rasbandit/ES-DE/roms    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "/home/rasbandit/Documents/local_steam   /home/rasbandit/ES-DE/roms/steam    none    bind    0   0" | sudo tee -a /etc/

echo "10.0.20.214:/mnt/main-pool/gaming-desktop-backups    /mnt/backup    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/ES-DE    /home/rasbandit/ES-DE    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "/home/rasbandit/Documents/local_steam   /home/rasbandit/ES-DE/roms/steam    none    bind,nofail    0   0" | sudo tee -a /etc/fstab

#Retroarch
echo "10.0.20.214:/mnt/cache/retroarch/desktop /home/rasbandit/.config/retroarch nfs4 rw,hard,intr,noatime,_netdev 0 0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/retroarch/shared/saves    /home/rasbandit/.config/retroarch/saves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/retroarch/shared/states    /home/rasbandit/.config/retroarch/states    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

#Dolphin
echo "10.0.20.214:/mnt/cache/dolphin/desktop/GameSettings    /home/rasbandit/.local/share/dolphin-emu/GameSettings    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/dolphin/shared/GC    /home/rasbandit/.local/share/dolphin-emu/GC    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/dolphin/shared/Wii    /home/rasbandit/.local/share/dolphin-emu/Wii    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/dolphin/shared/StateSaves    /home/rasbandit/.local/share/dolphin-emu/StateSaves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

sudo mkdir -p /mnt/es-de-nas
echo "10.0.20.214:/mnt/user/es-de /mnt/es-de-nas    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

sudo mount -a

sudo dnf copr enable lizardbyte/stable -y
sudo dnf copr enable lizardbyte/beta -y

sudo dnf upgrade --refresh

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

sudo dnf upgrade --refresh

#Proton
flatpak install flathub net.davidotek.pupgui2 -y
flatpak install flathub com.vysp3r.ProtonPlus -y
sudo flatpak install org.gnome.World.PikaBackup -y


~/.setup-scripts/autostart-link.sh es-de.desktop
~/.setup-scripts/autostart-link.sh org.gnome.World.PikaBackup.deskto
~/.setup-scripts/autostart-link.sh sol.desktop
~/.setup-scripts/autostart-link.sh steam.desktop
~/.setup-scripts/autostart-link.sh discord.desktop
~/.setup-scripts/autostart-link.sh sunshine.desktop


add_custom_keybinding "focus es-de" "/home/${USER}/.setup-scripts/scripts/focus_es-de.sh" "<Control><Shift><Alt>space"

add_custom_keybinding "launch-spotify" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh" "<Control><Shift><Alt>p"

add_custom_keybinding "music-next-track" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh next" "<Control><Shift><Alt>s"

add_custom_keybinding "msuic-volume-down" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh -" "<Control><Shift><Alt>d"

add_custom_keybinding "music-volume-up" "/home/${USER}/.setup-scripts/scripts/spotify-controll.sh +" "<Control><Shift><Alt>i"