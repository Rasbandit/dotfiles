#!/bin/bash

sudo dnf install -y \
    syncthing

systemctl --user enable --now syncthing.service

