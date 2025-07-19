#!/bin/bash

mkdir -p ~/.local/share/fonts
curl -L -o ~/.local/share/fonts/fonts.tar "https://nextcloud.ras.band/public.php/dav/files/GpCq3XxB684b85F/?accept=tar"
tar -xf ~/.local/share/fonts/fonts.tar -C ~/.local/share/fonts
rm ~/.local/share/fonts/fonts.tar