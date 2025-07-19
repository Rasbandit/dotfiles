#!/bin/bash

set -ex

echo "fastestmirror=true" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf
echo "installonly_limit=10" | sudo tee -a /etc/dnf/dnf.conf
echo "deltarpm=true" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf update -y

sudo dnf install dnf-plugin-system-upgrade
sudo dnf install -y flatpak
# sudo dnf group install Multimedia -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


~/.setup-scripts/dnf/generic-install.sh
