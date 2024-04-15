#!/bin/bash

set -ex

sudo dnf update

sudo dnf install dnf-plugin-system-upgrade
sudo dnf group install Multimedia -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

~/.setup-scripts/dnf/generic-install.sh
# ~/.setup-scripts/dnf/spotify.sh
# ~/.setup-scripts/dnf/vscode.sh
# ~/.setup-scripts/dnf/vivaldi.sh
# ~/.setup-scripts/dnf/vivaldi.sh
# ~/.setup-scripts/dnf/dbeaver.sh

# ~/.setup-scripts/other-installs/starship.sh

# if [ "$XDG_CURRENT_DESKTOP" = "ubuntu:GNOME" ]; then
#     ~/.setup-scripts/desktop-environments/gnome.sh
# elif [ "$XDG_CURRENT_DESKTOP" = "Unity" ]; then
#     echo "Command run from within VScode, run from terminal application"

#     read -p "Please enter your desktop environment (GNOME/KDE/XFCE, etc.): " desktop_environment
#         # Convert input to lowercase
#     desktop_environment=$(echo "$desktop_environment" | tr '[:upper:]' '[:lower:]')
#     # Run a file based on the input
#     case $desktop_environment in
#         gnome)
#             echo "Running file for GNOME"
#             ~/.setup-scripts/desktop-environments/gnome.sh
#             ;;
#         kde)
#             echo "Running file for KDE"
#             # Run file for KDE
#             ;;
#         xfce)
#             echo "Running file for XFCE"
#             # Run file for XFCE
#             ;;
#         *)
#             echo "Unknown desktop environment"
#             ;;
#     esac
# else
#     echo "Running a different desktop environment"
# fi

# mimeopen -d .yaml