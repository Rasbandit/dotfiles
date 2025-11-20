#!/bin/bash

wget "https://downloads.vivaldi.com/stable/vivaldi-stable-7.3.3635.11-1.x86_64.rpm"
sudo dnf install ./vivaldi-stable-7.3.3635.11-1.x86_64.rpm -y
rm ./vivaldi-stable-7.3.3635.11-1.x86_64.rpm
sudo dnf update --refresh -y