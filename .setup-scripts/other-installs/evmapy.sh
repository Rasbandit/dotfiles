#!/bin/bash

mkdir -p "${HOME}/Downloads/evmapy"
git clone git@github.com:Rasbandit/evmapy-updated.git "${HOME}/Downloads/evmapy"

cd "${HOME}/Downloads/evmapy"
sudo python3 setup.py install

echo 'ACTION=="add", KERNEL=="event[0-9]*", RUN+="/usr/bin/pkill -HUP -f evmapy"' | sudo tee /etc/udev/rules.d/99-evmapy-reload.rules >/dev/null
sudo udevadm control --reload-rules && sudo udevadm trigger --subsystem-match=input

~/.setup-scripts/scripts/autostart-link.sh link evmapy.desktop
rm -rf "${HOME}/Downloads/evmapy"

cd ~/.setup-scripts