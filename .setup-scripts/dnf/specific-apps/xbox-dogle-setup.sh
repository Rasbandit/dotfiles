#! /bin/bash

sudo dnf copr enable sentry/xone
sudo dnf install xone lpf-xone-firmware
sudo lpf approve xone-firmware
sudo lpf build xone-firmware
sudo lpf install xone-firmware
reboot
