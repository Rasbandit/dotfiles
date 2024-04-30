#!/bin/bash

echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update && sudo apt install nala -y

sudo nala fetch --https-only --auto --non-free -y
sudo nala upgrade -y
sudo nala install -y \
software-properties-common \
apt-transport-https \
wget

~/.setup-scripts/apt/generic-install.sh

if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
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
