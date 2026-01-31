#!/bin/bash

# Install "Activate Window By Title" GNOME extension
# Required for scripts that need to focus windows on Wayland (e.g., 1password-toggle.sh)

# Install gnome-extensions-cli
if command -v pipx >/dev/null 2>&1; then
    pipx install gnome-extensions-cli
else
    pip install --user gnome-extensions-cli
fi

# Ensure gext is in PATH
GEXT="${HOME}/.local/bin/gext"

# Install and enable the extension
"$GEXT" install activate-window-by-title@lucaswerkmeister.de
gnome-extensions enable activate-window-by-title@lucaswerkmeister.de
