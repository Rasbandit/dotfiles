#!/bin/bash

# GitHub repository details
OWNER="obsidianmd"
REPO="obsidian-releases"

# File extension to download
FILE_EXTENSION=".deb"

# URL for latest release
URL="https://api.github.com/repos/$OWNER/$REPO/releases/latest"

# Fetch release information
response=$(curl -sSL "$URL")

# Parse assets URL and download the file
asset_url=$(echo "$response" | jq -r ".assets[] | select(.name | endswith(\"$FILE_EXTENSION\")) | .browser_download_url")

if [ -n "$asset_url" ]; then
    echo "Downloading: $asset_url"
    wget -O "obsidian.deb" "$asset_url"
    echo "Download complete."

    sudo nala install ./obsidian.deb -y

    rm ./obsidian.deb
else
    echo "No release found with the specified file extension."
fi
