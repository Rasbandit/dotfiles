#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo dpkg --add-architecture i386 -y
sudo add-apt-repository multiverse -y
sudo apt-get dist-upgrade
sudo apt update -y
sudo apt install steam -y