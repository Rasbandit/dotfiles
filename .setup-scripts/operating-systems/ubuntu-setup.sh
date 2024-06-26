#!/bin/bash

sudo apt update

sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

~/.setup-scripts/apt/generic-install.sh

if [ "$XDG_CURRENT_DESKTOP" = "ubuntu:GNOME" ]; then
    ~/.setup-scripts/desktop-environments/gnome.sh
elif [ "$XDG_CURRENT_DESKTOP" = "Unity" ]; then
    echo "Command run from within VScode, run from terminal application"

    read -p "Please enter your desktop environment (GNOME/KDE/XFCE, etc.): " desktop_environment
        # Convert input to lowercase
    desktop_environment=$(echo "$desktop_environment" | tr '[:upper:]' '[:lower:]')
    # Run a file based on the input
    case $desktop_environment in
        gnome)
            echo "Running file for GNOME"
            ~/.setup-scripts/desktop-environments/gnome.sh
            ;;
        kde)
            echo "Running file for KDE"
            # Run file for KDE
            ;;
        xfce)
            echo "Running file for XFCE"
            # Run file for XFCE
            ;;
        *)
            echo "Unknown desktop environment"
            ;;
    esac
else
    echo "Running a different desktop environment"
fi