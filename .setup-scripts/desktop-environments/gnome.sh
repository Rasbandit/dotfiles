#!/bin/bash

source ~/.setup-scripts/desktop-environments/add_custom_keybinding.sh

pip3 install --upgrade gnome-extensions-cli --break-system-packages


gnome-extensions-cli install \
blur-my-shell@aunetx \
quick-settings-tweaks@qwreey \
caffeine@patapon.info

# sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/quick-settings-tweaks@qwreey/schemas/org.gnome.shell.extensions.quick-settings-tweaks.gschema.xml /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Blur my shell
# gsettings set org.gnome.shell.extensions.blur-my-shell sigma 10
# gsettings set org.gnome.shell.extensions.blur-my-shell brightness 0.7
# gsettings set org.gnome.shell.extensions.blur-my-shell color "(0.0, 0.0, 0.0, 0.0)"
# gsettings set org.gnome.shell.extensions.blur-my-shell noise-amount 0.02


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
# mkdir -p ~/.themes
# curl -L -o ~/.themes/dracula.tar.xz "https://nextcloud.ras.band/public.php/dav/files/X57wi6dmwGYKc4A"
# tar -xf ~/.themes/dracula.tar.xz -C ~/.themes
# gsettings set org.gnome.desktop.interface gtk-theme Dracula
# gsettings set org.gnome.desktop.wm.preferences theme Dracula
# gsettings set org.gnome.shell.extensions.user-theme name 'Dracula'
# rm ~/.themes/dracula.tar.xz

# Icon
curl -L -o ~/.local/share/icons/papirus.tar.xz "https://nextcloud.ras.band/public.php/dav/files/cEASEBKXN3Ag25e/?accept=tar"
tar -xf ~/.local/share/icons/papirus.tar.xz -C ~/.local/share/icons
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
rm ~/.local/share/icons/papirus.tar.xz

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
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"

# Font
gsettings set org.gnome.desktop.interface monospace-font-name 'MonoLisa Nerd Font Regular 13'

# Nemo
# gsettings set org.nemo.preferences show-location-entry true
# gsettings set org.nemo.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'date_created_with_time']"
# gsettings set org.nemo.preferences show-open-in-terminal-toolbar true

# Search
gsettings set org.gnome.desktop.search-providers disabled "['org.gnome.Software.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Contacts.desktop']"


<<<<<<< HEAD
add_custom_keybinding "1pass Quick" "1password --quick-access" "<Control><Shift>space"
add_custom_keybinding "1pass" "1password" "<Control><Shift>backslash"
=======

add_custom_keybinding "1pass Quick" "1password --quick-access" "<Control><Shift><Alt>space"
add_custom_keybinding "1pass" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh 1Password 1password" "<Control><Shift><Alt>1"
add_custom_keybinding "Vivaldi" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh Vivaldi vivaldi" "<Control><Shift><Alt>v"
add_custom_keybinding "Spotify" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh spotify" "<Control><Shift><Alt>s"
add_custom_keybinding "Ghostty" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh com.mitchellh.ghostty ghostty" "<Control><Shift><Alt>t"
add_custom_keybinding "VSCode" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh Code code" "<Control><Shift><Alt>c"
add_custom_keybinding "Discord" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh discord 'flatpak run com.discordapp.Discord'" "<Control><Shift><Alt>d"
add_custom_keybinding "Obsidian" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh obsidian 'flatpak run md.obsidian.Obsidian'" "<Control><Shift><Alt>q"
add_custom_keybinding "Slack" "/home/${USER}/.setup-scripts/scripts/focus-or-run.sh Slack slack" "<Control><Shift><Alt>s"
add_custom_keybinding "Emoji" "flatpak run com.tomjwatson.Emote" "<Control><Shift><Alt>semicolon"
>>>>>>> 6e5c7f3 (2026-01-31 14:46)
