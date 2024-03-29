#!/bin/bash

wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_2.1.3.zip
# sha1sum: 2646edd5ad2cfb046c9c695fa6d564d33be0f38b
unzip droidcam_latest.zip -d droidcam
cd droidcam && sudo ./install-client
rm droidcam_latest.zip 
sudo apt install linux-headers-`uname -r` gcc make