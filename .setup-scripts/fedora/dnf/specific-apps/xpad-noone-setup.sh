#! /bin/bash

sudo dnf install dkms

sudo modprobe -r xpad

cd ~/Downloads

git clone https://github.com/medusalix/xpad-noone

sudo cp -r xpad-noone /usr/src/xpad-noone-1.0
sudo dkms install -m xpad-noone -v 1.0

sudo modprobe xpad-noone


ENABLE_HDR_WSI=1 gamescope -f -w 3840 -h 2160 --hdr-enabled --hdr-debug-force-output -- env ENABLE_GAMESCOPE_WSI=1 DXVK_HDR=1 DISABLE_HDR_WSI=1  %command% --skip-launcher
