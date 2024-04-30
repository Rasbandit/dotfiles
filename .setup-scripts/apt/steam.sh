#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt-get dist-upgrade
sudo apt install steam -y
