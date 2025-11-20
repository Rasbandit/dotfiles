#! /bin/bash

#NAS Mounts
echo "10.0.20.214:/mnt/main-pool/gaming-desktop-backups    /mnt/backup    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/ES-DE    /home/rasbandit/ES-DE    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "/home/rasbandit/Documents/local_steam   /home/rasbandit/ES-DE/roms/steam    none    bind,nofail    0   0" | sudo tee -a /etc/fstab

#Retroarch
echo "10.0.20.214:/mnt/cache/retroarch/desktop /home/rasbandit/.config/retroarch nfs4 rw,hard,intr,noatime,_netdev 0 0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/retroarch/shared/saves    /home/rasbandit/.config/retroarch/saves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/retroarch/shared/states    /home/rasbandit/.config/retroarch/states    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/retroarch/shared/remaps    /home/rasbandit/.config/retroarch/config/remaps    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

#Dolphin
echo "10.0.20.214:/mnt/cache/dolphin/desktop/GameSettings    /home/rasbandit/.local/share/dolphin-emu/GameSettings    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/dolphin/shared/GC    /home/rasbandit/.local/share/dolphin-emu/GC    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/dolphin/shared/Wii    /home/rasbandit/.local/share/dolphin-emu/Wii    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/cache/dolphin/shared/StateSaves    /home/rasbandit/.local/share/dolphin-emu/StateSaves    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab

sudo mount -a
