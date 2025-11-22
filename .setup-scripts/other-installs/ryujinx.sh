#!/bin/bash

DEST_DIR="$HOME/Applications/publish"
DEST_FILE="Ryujinx"
ICON_FILE_LOC="$HOME/Pictures/desktop-icons"

mkdir -p "${DEST_DIR}"
curl -L -o "${DEST_DIR}/${DEST_FILE}" "https://nextcloud.ras.band/public.php/dav/files/jPG2SPHq3Zw9gBD"
chmod +x "${DEST_DIR}/${DEST_FILE}"

curl -L -o "${ICON_FILE_LOC}/ryujinx.png" "https://nextcloud.ras.band/public.php/dav/files/SkM7fo86DxKorgr"
~/.setup-scripts/scripts/create-desktop-file.sh "Ryujinx" "$DEST_DIR/$DEST_FILE" "${ICON_FILE_LOC}/ryujinx.png" "Ryujinx Switch Emulator"

