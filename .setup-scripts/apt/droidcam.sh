#!/bin/bash

ORIGINAL_DIRECTORY=$PWD

cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_2.1.3.zip
# sha1sum: 2646edd5ad2cfb046c9c695fa6d564d33be0f38b
unzip droidcam_latest.zip -d droidcam
cd droidcam && sudo ./install-client
sudo apt install linux-headers-`uname -r` gcc make -y
sudo ./install-video 
sudo ./install-sound
sudo apt-get install -y adb
sudo rmmod v4l2loopback_dc
sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=1920 height=1080
cd ..
rm droidcam_latest.zip 

cd $ORIGINAL_DIRECTORY