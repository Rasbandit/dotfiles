#!/bin/bash

pip3 install --upgrade gnome-extensions-cli --break-system-packages

#Pano Requirements
sudo apt install gir1.2-gda-5.0 gir1.2-gsound-1.0 -y

gnome-extensions-cli install \
blur-my-shell@aunetx \
appindicatorsupport@rgcjonas.gmail.com \
Vitals@CoreCoding.com \
pano@elhan.io

sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com/schemas/org.gnome.shell.extensions.appindicator.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com/schemas/org.gnome.shell.extensions.vitals.gschema.xml /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com


gsettings set org.gnome.shell.extensions.blur-my-shell sigma 10
gsettings set org.gnome.shell.extensions.blur-my-shell brightness 0.7
gsettings set org.gnome.shell.extensions.blur-my-shell color "(0.0, 0.0, 0.0, 0.0)"
gsettings set org.gnome.shell.extensions.blur-my-shell noise-amount 0.02

gsettings set org.gnome.shell.extensions.vitals hot-sensors "['_memory_usage_', '_processor_usage_', '__temperature_avg__', '_battery_time_left_']"
gsettings set org.gnome.shell.extensions.vitals show-battery true

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
curl -L -o ~/.icons/papirus.tar.xz "https://drive.google.com/uc?export=download&id=1V3oPRCZwKLVXN24-T8vIV7ojecmpofUJ"
tar -xf ~/.icons/papirus.tar.xz -C ~/.icons
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
rm ~/.icons/papirus.tar.xz

# Appearance
mkdir -p ~/Pictures/desktop-pictures
curl -L -o ~/Pictures/desktop-pictures/galaxy.jpg "https://drive.google.com/uc?export=download&id=1CwD_YmH7e1-pRLHsYy9DDBT_vV93v6rm"
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
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

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
gsettings set org.nemo.preferences show-location-entry true
gsettings set org.nemo.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'date_created_with_time']"
gsettings set org.nemo.preferences show-open-in-terminal-toolbar true

# Search
gsettings set org.gnome.desktop.search-providers disabled "['org.gnome.Software.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Contacts.desktop']"

# Terminal
profiles_list=$(dconf read /org/gnome/terminal/legacy/profiles:/list)
profile_id=$(echo "$profiles_list" | grep -oP "\[.*?\]" | tr -d '[]' | awk '{print $1}')
profile_id="${profile_id//\'}"

dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/visible-name "'default'"
~/.setup-scripts/desktop-environments/terminal-theme/install.sh -s Dracula -p default --install-dircolors
dconf write /org/gnome/terminal/legacy/profiles:/:${profile_id}/audible-bell false
dconf write /org/gnome/terminal/legacy/profiles:/:${profile_id} scrollback-unlimited true
