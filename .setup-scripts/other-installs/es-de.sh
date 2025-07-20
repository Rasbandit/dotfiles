#!/bin/bash

URL="https://gitlab.com/es-de/emulationstation-de/-/package_files/210210324/download"
DEST_DIR="$HOME/Applications"
DEST_FILE="ES-DE_x64.AppImage"

mkdir -p "$DEST_DIR"
wget -O "$DEST_DIR/$DEST_FILE" "$URL"
chmod +x "$DEST_DIR/$DEST_FILE"
