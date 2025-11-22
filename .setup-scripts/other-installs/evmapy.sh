#!/bin/bash

mkdir -p "${HOME}/Downloads/evmapy"
git clone git@github.com:Rasbandit/evmapy-updated.git "${HOME}/Downloads/evmapy"

cd "${HOME}/Downloads/evmapy"
sudo python3 setup.py install

~/.setup-scripts/scripts/autostart-link.sh link evmapy.desktop
rm -rf "${HOME}/Downloads/evmapy"

cd ~/.setup-scripts