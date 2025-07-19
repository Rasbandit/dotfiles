#!/bin/bash

curl -L -o ~/Downloads/dracula-pro.vsix "https://nextcloud.ras.band/public.php/dav/files/gaBCyX3XeTbBKyF/?accept=zip"
# unzip ~/Downloads/vs-code-dracula-theme.zip -d ~/Downloads

code --install-extension ~/Downloads/dracula-pro.vsix

# rm ~/Downloads/vs-code-dracula-theme.zip
# rm -r ~/Downloads/visual-studio-code