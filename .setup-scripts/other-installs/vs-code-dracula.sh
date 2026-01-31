#!/bin/bash

<<<<<<< HEAD
VS_CODE_EXT="/home/${USER}/Downloads/dracula-pro.vsix"

curl -L -o "${VS_CODE_EXT}" "https://nextcloud.ras.band/public.php/dav/files/gaBCyX3XeTbBKyF/?accept=zip"

code --install-extension "${VS_CODE_EXT}"

rm "${VS_CODE_EXT}"
=======
curl -L -o ~/Downloads/dracula-pro.vsix "https://nextcloud.ras.band/public.php/dav/files/gaBCyX3XeTbBKyF/?accept=zip"

code --install-extension ~/Downloads/dracula-pro.vsix
>>>>>>> 6e5c7f3 (2026-01-31 14:46)
