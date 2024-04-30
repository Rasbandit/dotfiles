#!/bin/bash

mkdir -p ~/.local/share/fonts
curl -L -o ~/.local/share/fonts/fonts.tar.gz "https://drive.google.com/uc?export=download&id=1Y6pr7AVh_WvU0jOLPscu_T8PvX8cxmfr"
tar -xf ~/.local/share/fonts/fonts.tar.gz -C ~/.local/share/fonts
rm ~/.local/share/fonts/fonts.tar.gz