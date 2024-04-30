#!/bin/bash

sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y

sudo curl https://sh.rustup.rs -sSf | sh

git clone https://github.com/jwilm/alacritty.git