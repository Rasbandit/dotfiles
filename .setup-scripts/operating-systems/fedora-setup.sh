#!/bin/bash

set -ex

sudo dnf update

sudo dnf install dnf-plugin-system-upgrade
sudo dnf group install Multimedia -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

~/.setup-scripts/dnf/generic-install.sh
