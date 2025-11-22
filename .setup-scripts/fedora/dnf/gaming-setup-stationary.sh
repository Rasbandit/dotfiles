#! /bin/bash

~/.setup-scripts/scripts/autostart-link.sh link org.gnome.World.PikaBackup.deskto
~/.setup-scripts/scripts/autostart-link.sh link sol.desktop
~/.setup-scripts/scripts/autostart-link.sh link discord.desktop
~/.setup-scripts/scripts/autostart-link.sh link sunshine.desktop

# NAS Mounts
echo "# ES-DE Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/main-pool/gaming-desktop-backups    /mnt/backup    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/ES-DE    /home/${USER}/ES-DE    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab


# Retroarch
mkdir -p /home/${USER}/.config/retroarch/{saves,states,config/remaps}
echo "# Retroarch Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/desktop /home/${USER}/.config/retroarch nfs4 rw,hard,intr,noatime,_netdev 0 0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/shared/saves    /home/${USER}/.config/retroarch/saves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/shared/states    /home/${USER}/.config/retroarch/states    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/retroarch/shared/remaps    /home/${USER}/.config/retroarch/config/remaps    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

# Dolphin
mkdir -p /home/${USER}/.local/share/dolphin-emu/{GC,Wii,StateSaves}
mkdir -p /home/${USER}/.config/dolphin-emu
echo "# Dolphin Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/desktop/share    /home/${USER}/.local/share/dolphin-emu    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/desktop/config    /home/${USER}/.config/dolphin-emu    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/shared/GC    /home/${USER}/.local/share/dolphin-emu/GC    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/shared/Wii    /home/${USER}/.local/share/dolphin-emu/Wii    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/dolphin/shared/StateSaves    /home/${USER}/.local/share/dolphin-emu/StateSaves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

# Ryujinx
mkdir -p /home/${USER}/.config/Ryujinx
echo "# Dolphin Mounts" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/emulators/ryujinx /home/${USER}/.config/ryujinx nfs4 rw,hard,intr,noatime,_netdev 0 0" | sudo tee -a /etc/fstab


systemctl daemon-reload
sudo mount -a
