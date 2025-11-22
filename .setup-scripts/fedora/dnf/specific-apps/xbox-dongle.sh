#! /bin/bash

sudo dnf copr enable sentry/xone -y
sudo dnf install xone lpf-xone-firmware -y
sudo lpf approve xone-firmware -y
sudo lpf build xone-firmware -y
sudo lpf install xone-firmware -y
