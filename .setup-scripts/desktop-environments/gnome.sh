#!/bin/bash

gsettings set org.gnome.shell disabled-extensions "['window-list@gnome-shell-extensions.gcampax.github.com', 'windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'auto-move-windows@gnome-shell-extensions.gcampax.github.com', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com']"

gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com']"

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

mkdir -p ~/.icons
curl -L -o ~/.icons/dracula.zip "https://drive.google.com/uc?export=download&id=1Q9SEf5s0-CldTSMPmIk-vN73y46cLeC4"
unzip -d ~/.icons/ ~/.icons/dracula.zip
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
rm ~/.icons/dracula.zip

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

# Terminal

profiles_list=$(dconf read /org/gnome/terminal/legacy/profiles:/list)
profile_id=$(echo "$profiles_list" | grep -oP "\[.*?\]" | tr -d '[]' | awk '{print $1}')
profile_id="${profile_id//\'}"

dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/visible-name "'default'"
~/.setup-scripts/desktop-environments/terminal-theme/install.sh -s Dracula -p default --install-dircolors
dconf write /org/gnome/terminal/legacy/profiles:/:${profile_id}/audible-bell false
dconf write /org/gnome/terminal/legacy/profiles:/:${profile_id} scrollback-unlimited true
