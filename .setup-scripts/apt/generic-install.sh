#!/bin/bash

sudo add-apt-repository multiverse
sudo apt update&& sudo apt upgrade && sudo apt upgrade


sudo apt install -y \
curl \
default-jdk \
jq \
yq \
vlc

sudo snap install discord todoist
sudo snap set core experimental.refresh-app-awareness=true

## INSOMNIA/postman
## kubectl
## nord
## Wireguard
## droidcam