#!/bin/bash

# wget https://github.com/obsidianmd/obsidian-releases/releases/latest
# apt install -y obsidian_1.5.11_amd64.deb

# GitHub repository and release URL
REPO_OWNER="obsidianmd"
REPO_NAME="obsidian-releases"
RELEASE_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/latest"

# Fetch the release page HTML
HTML=$(curl -sSL $RELEASE_URL)

# Extract the download URL for the latest release ending with "_amd64.deb"
DOWNLOAD_URL=$(echo "$HTML" | xmllint --html --xpath '//a[contains(@href, "_amd64.deb")]/@href' - 2>/dev/null | cut -d '"' -f 2)

# Download the release
if [ -n "$DOWNLOAD_URL" ]; then
    echo "Downloading latest release from $DOWNLOAD_URL"
    # wget "https://github.com$DOWNLOAD_URL"
else
    echo "Failed to extract download URL for _amd64.deb file."
    exit 1
fi