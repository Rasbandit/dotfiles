#! /bin/bash

~/.setup-scripts/scripts/autostart-link.sh link org.gnome.World.PikaBackup.deskto
~/.setup-scripts/scripts/autostart-link.sh link sol.desktop
~/.setup-scripts/scripts/autostart-link.sh link discord.desktop
~/.setup-scripts/scripts/autostart-link.sh link sunshine.desktop

# NAS Mounts
echo "# ES-DE Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/main-pool/gaming-desktop-backups    /mnt/backup    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/ES-DE    ${HOME}/ES-DE    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab


# Retroarch
mkdir -p ${HOME}/.var/app/org.libretro.RetroArch/config/retroarch/{saves,states,config/remaps}
echo "# Retroarch Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/desktop ${HOME}/.var/app/org.libretro.RetroArch/config/retroarch nfs4 rw,hard,intr,noatime,_netdev 0 0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/shared/saves    ${HOME}/.var/app/org.libretro.RetroArch/config/retroarch/saves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/shared/states    ${HOME}/.var/app/org.libretro.RetroArch/config/retroarch/states    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/shared/remaps    ${HOME}/.var/app/org.libretro.RetroArch/config/retroarch/config/remaps    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

# Dolphin
mkdir -p ${HOME}/.local/share/dolphin-emu/{GC,Wii,StateSaves}
mkdir -p ${HOME}/.config/dolphin-emu
echo "# Dolphin Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/desktop/share    ${HOME}/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/desktop/config    ${HOME}/.var/app/org.DolphinEmu.dolphin-emu/config/dolphin-emu    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/shared/GC    ${HOME}/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/GC    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/shared/Wii    ${HOME}/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/Wii    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/shared/StateSaves    ${HOME}/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/StateSaves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

# Ryujinx
mkdir -p ${HOME}/.config/Ryujinx
echo "# Dolphin Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/ryujinx ${HOME}/.config/ryujinx nfs4 rw,hard,intr,noatime,_netdev 0 0" | sudo tee -a /etc/fstab

# Other Mounts
mkdir -p ${HOME}/.local/share/sm64ex
echo "# Other Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/ports/mario-64-pc ${HOME}/.local/share/sm64ex nfs4 rw,hard,intr,noatime,_netdev 0 0" | sudo tee -a /etc/fstab

systemctl daemon-reload
sudo mount -a
