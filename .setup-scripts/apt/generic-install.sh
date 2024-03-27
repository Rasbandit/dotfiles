#!/bin/bash

sudo add-apt-repository multiverse
sudo apt update&& sudo apt upgrade && sudo apt upgrade


sudo apt install -y \
curl \
default-jdk \
jq \
yq \
vlc

sudo snap refresh
sudo snap install discord todoist
sudo snap set core experimental.refresh-app-awareness=true

## INSOMNIA/postman
## nord
## Wireguard
## droidcam
## terraform
## helm
## tailscale
## steam

## Nvidia drivers?
## wine/proton?
## Readme
## Ledger