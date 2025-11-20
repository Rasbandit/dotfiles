#!/bin/bash

dnf copr enable sentry/xone
dnf install xone lpf-xone-firmware
lpf approve xone-firmware
lpf build xone-firmware
lpf install xone-firmware
#reboot

# dnf copr enable atim/xpadneo
# dnf install xpadneo