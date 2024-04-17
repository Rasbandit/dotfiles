#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo dpkg --add-architecture i386
sudo add-apt-repository multiverse
sudo apt-get dist-upgrade
sudo apt update -y
sudo apt install steam -y

# TODO Fix for debian
# deb http://deb.debian.org/debian/ bookworm main contrib non-free
# apt install steam-installer