#!/bin/bash

XPAD_NOONE_DIR="${HOME}/Downloads/xpad-noone"

sudo dnf install dkms -y

git clone https://github.com/medusalix/xpad-noone ${XPAD_NOONE_DIR}

sudo cp -r "${XPAD_NOONE_DIR}" /usr/src/xpad-noone-1.0
sudo dkms install -m xpad-noone -v 1.0

sudo modprobe xpad-noone

rm -rf "${XPAD_NOONE_DIR}"