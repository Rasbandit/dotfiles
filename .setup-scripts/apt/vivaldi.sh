#!/bin/bash

# Vivaldi Install
wget -qO- http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] http://repo.vivaldi.com/stable/deb/ stable main" -y
sudo apt update
sudo apt install vivaldi-stable -y

