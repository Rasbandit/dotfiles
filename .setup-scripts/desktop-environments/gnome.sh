#!/bin/bash

sudo apt update && sudo apt install -y \
gnome-tweaks \
dconf-editor

# Default Apps
sudo update-alternatives --set x-www-browser /usr/bin/vivaldi-stable
sudo update-alternatives --set editor /usr/bin/code

# Appearance
mkdir -p ~/Pictures/desktop-pictures
curl -L -o ~/Pictures/desktop-pictures/galaxy.jpg "https://drive.google.com/uc?export=download&id=1CwD_YmH7e1-pRLHsYy9DDBT_vV93v6rm"
gsettings set org.gnome.desktop.background picture-uri "file:///home/rasbandit/Pictures/desktop-pictures/galaxy.jpg"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/rasbandit/Pictures/desktop-pictures/galaxy.jpg"
gsettings set org.gnome.desktop.screensaver picture-uri "file:///home/rasbandit/Pictures/desktop-pictures/galaxy.jpg"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-purple-dark'

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

# Font
gsettings set org.gnome.desktop.interface monospace-font-name 'MonoLisa 13'

# Terminal

profiles_list=$(dconf read /org/gnome/terminal/legacy/profiles:/list)
profile_id=$(echo "$profiles_list" | grep -oP "\[.*?\]" | tr -d '[]' | awk '{print $1}')
profile_id="${profile_id//\'}"

dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/visible-name "'default'"
~/.setup-scripts/desktop-environments/terminal-theme/install.sh -s Dracula -p default
dconf write /org/gnome/terminal/legacy/profiles:/:${profile_id}/audible-bell false
dconf write /org/gnome/terminal/legacy/profiles:/:${profile_id} scrollback-unlimited true
