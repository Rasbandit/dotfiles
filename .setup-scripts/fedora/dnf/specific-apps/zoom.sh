#!/bin/bash

wget https://zoom.us/client/latest/zoom_x86_64.rpm
sudo dnf localinstall ./zoom_x86_64.rpm -y
rm -f ./zoom_x86_64.rpm