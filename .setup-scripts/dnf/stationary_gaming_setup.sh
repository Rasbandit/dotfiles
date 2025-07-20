#! /bin/bash

cd /home/rasbandit/Downloads

echo "10.0.20.214:/mnt/user/gaming-desktop-backup    /mnt/backup    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "10.0.20.214:/mnt/user/es-de/roms    /home/rasbandit/ES-DE/roms    nfs4    rw,hard,intr,noatime,_netdev    0    0" | sudo tee -a /etc/fstab
echo "/home/rasbandit/local_steam   /home/rasbandit/ES-DE/roms/steam    none    bind    0    0" | sudo tee -a /etc/fstab

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
lutris 

sudo dnf upgrade --refresh

#Proton
flatpak install flathub net.davidotek.pupgui2 -y
flatpak install flathub com.vysp3r.ProtonPlus -y
sudo flatpak install org.gnome.World.PikaBackup -y

#Evmapy
# git clone https://github.com/kempniu/evmapy.git
# cd evmapy
# pip install setuptools --upgrade -y
# pip3 install evdev
# sudo python3 setup.py install

# sudo sh -c 'echo SUBSYSTEM==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"057e\", ATTRS{idProduct}==\"0337\", MODE=\"0666\" > /etc/udev/rules.d/51-gcadapter.rules;echo SUBSYSTEM==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"2e8a\", ATTRS{idProduct}==\"102b\", MODE=\"0666\" > /etc/udev/rules.d/51-losslessadapter.rules;udevadm control --reload-rules'

~/.setup-scripts/autostart-link.sh es-de.desktop
~/.setup-scripts/autostart-link.sh org.gnome.World.PikaBackup.deskto
~/.setup-scripts/autostart-link.sh sol.desktop
~/.setup-scripts/autostart-link.sh steam.desktop
~/.setup-scripts/autostart-link.sh discord.desktop
~/.setup-scripts/autostart-link.sh sunshine.desktop