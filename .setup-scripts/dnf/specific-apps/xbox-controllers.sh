#!/bin/bash

sudp dnf copr enable sentry/xone -y
dnf install xone lpf-xone-firmware
lpf approve xone-firmware
lpf build xone-firmware
lpf install xone-firmware
reboot

dnf copr enable atim/xpadneo
dnf install xpadneo