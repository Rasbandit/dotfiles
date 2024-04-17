#!/bin/bash

curl -1sLf \
  'https://packages.konghq.com/public/insomnia/setup.deb.sh' \
  | sudo -E distro=ubuntu codename=focal bash
sudo apt-get update
sudo apt-get install insomnia