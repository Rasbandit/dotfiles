#!/bin/bash

URL="https://gitlab.com/es-de/emulationstation-de/-/package_files/210210324/download"
DEST_DIR="$HOME/Applications"
DEST_FILE="ES-DE_x64.AppImage"
ICON_FILE_LOC="$HOME/Pictures/desktop-pictures/desktop-icons"

mkdir -p "$DEST_DIR"
wget -O "$DEST_DIR/$DEST_FILE" "$URL"
chmod +x "$DEST_DIR/$DEST_FILE"

curl -L -o "${ICON_FILE_LOC}/ES-DE.png" "https://nextcloud.ras.band/public.php/dav/files/gyTN9gRiAPGTzmH"
~/.setup-scripts/scripts/create-desktop-file.sh "ES-DE" "$DEST_DIR/$DEST_FILE" "${ICON_FILE_LOC}/ES-DE.png" "EmulationStation-DE Frontend"