#!/bin/bash

pip3 install --upgrade gnome-extensions-cli --break-system-packages

#Pano Requirements
sudo nala install gir1.2-gda-5.0 gir1.2-gsound-1.0 -y

gnome-extensions-cli install \
blur-my-shell@aunetx 

sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
# sudo cp ~/.local/share/gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com/schemas/org.gnome.shell.extensions.appindicator.gschema.xml /usr/share/glib-2.0/schemas/
# sudo cp ~/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com/schemas/org.gnome.shell.extensions.vitals.gschema.xml /usr/share/glib-2.0/schemas/
# sudo cp ~/.local/share/gnome-shell/extensions/pano@elhan.io/schemas/org.gnome.shell.extensions.pano.gschema.xml /usr/share/glib-2.0/schemas/
# sudo cp ~/.local/share/gnome-shell/extensions/quick-settings-tweaks@qwreey/schemas/org.gnome.shell.extensions.quick-settings-tweaks.gschema.xml /usr/share/glib-2.0/schemas/

# sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Blur my shell
gsettings set org.gnome.shell.extensions.blur-my-shell sigma 10
gsettings set org.gnome.shell.extensions.blur-my-shell brightness 0.7
gsettings set org.gnome.shell.extensions.blur-my-shell color "(0.0, 0.0, 0.0, 0.0)"
gsettings set org.gnome.shell.extensions.blur-my-shell noise-amount 0.02

# Vitals
# gsettings set org.gnome.shell.extensions.vitals hot-sensors "['_memory_usage_', '_processor_usage_', '__temperature_avg__', '_battery_time_left_']"
# gsettings set org.gnome.shell.extensions.vitals show-battery true

# Pano Clipboard manager
# gsettings set org.gnome.shell.extensions.pano send-notification-on-copy false
# gsettings set org.gnome.shell.extensions.pano play-audio-on-copy false
# gsettings set org.gnome.shell.extensions.pano keep-search-entry false
# gsettings set org.gnome.shell.extensions.pano history-length 100

# Quick Settings Tweaks
gsettings set org.gnome.shell.extensions.quick-settings-tweaks output-show-selected true
gsettings set org.gnome.shell.extensions.quick-settings-tweaks input-show-selected true

# Default Apps
sudo update-alternatives --set x-www-browser /usr/bin/vivaldi-stable
sudo update-alternatives --set editor /usr/bin/code

# Interface
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Theme
mkdir -p ~/.themes
curl -L -o ~/.themes/dracula.tar.xz "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1642717809/Dracula.tar.xz?response-content-disposition=attachment%3B%2520Dracula.tar.xz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20240417%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240417T100245Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=91b4516727bd39266a2817369a094ee2457de8d34fc5103a4469adca19250d5f"
tar -xf ~/.themes/dracula.tar.xz -C ~/.themes
gsettings set org.gnome.desktop.interface gtk-theme Dracula
gsettings set org.gnome.desktop.wm.preferences theme Dracula
gsettings set org.gnome.shell.extensions.user-theme name 'Dracula'
rm ~/.themes/dracula.tar.xz

# Icon
mkdir -p ~/.icons
curl -L -o ~/.local/share/.icons/papirus.tar.xz "https://drive.google.com/uc?export=download&id=1V3oPRCZwKLVXN24-T8vIV7ojecmpofUJ"
tar -xf ~/.local/share/.icons/papirus.tar.xz -C ~/.local/share/icons
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
rm ~/.icons/papirus.tar.xz

# Appearance
mkdir -p ~/Pictures/desktop-pictures
curl -L -o ~/Pictures/desktop-pictures/galaxy.jpg "https://nextcloud.ras.band/public.php/dav/files/XQfty9SAfLcHCse/?accept=zip"
gsettings set org.gnome.desktop.background picture-uri "file:///home/rasbandit/Pictures/desktop-pictures/galaxy.jpg"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/rasbandit/Pictures/desktop-pictures/galaxy.jpg"
gsettings set org.gnome.desktop.screensaver picture-uri "file:///home/rasbandit/Pictures/desktop-pictures/galaxy.jpg"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Mouse
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'

# Keybaord
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'jp')]"
gsettings set org.gnome.desktop.input-sources mru-sources "[('xkb', 'us')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape_shifted_capslock']"

# Sound
gsettings set org.gnome.desktop.sound event-sounds false 

# Clock
gsettings set org.gnome.desktop.datetime automatic-timezone false
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true

# Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 34
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'spotify.desktop', 'code.desktop', 'vivaldi-stable.desktop', 'org.gnome.Terminal.desktop']"

# Desktop
gsettings set org.gnome.desktop.wm.keybindings switch-applications []
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward []
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"

# Font
gsettings set org.gnome.desktop.interface monospace-font-name 'MonoLisa Nerd Font Regular 13'

# Nemo
# gsettings set org.nemo.preferences show-location-entry true
# gsettings set org.nemo.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'date_created_with_time']"
# gsettings set org.nemo.preferences show-open-in-terminal-toolbar true

# Search
gsettings set org.gnome.desktop.search-providers disabled "['org.gnome.Software.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Contacts.desktop']"

