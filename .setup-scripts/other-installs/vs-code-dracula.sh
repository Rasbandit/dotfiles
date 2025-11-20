#!/bin/bash

VS_CODE_EXT="/home/${USER}/Downloads/dracula-pro.vsix"

curl -L -o "${VS_CODE_EXT}" "https://nextcloud.ras.band/public.php/dav/files/gaBCyX3XeTbBKyF/?accept=zip"

code --install-extension "${VS_CODE_EXT}"

rm "${VS_CODE_EXT}"
