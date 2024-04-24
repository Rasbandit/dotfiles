#!/bin/bash

# touch ~/.bash_secrets

mkdir -p ~/.local/share/fonts
curl -L -o ~/.icons/papirus.tar.xz "https://drive.google.com/uc?export=download&id=1V3oPRCZwKLVXN24-T8vIV7ojecmpofUJ"
tar -xf ~/.icons/papirus.tar.xz -C ~/.icons
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
rm ~/.icons/papirus.tar.xz

# OS_INFO=$(cat /etc/os-release)

# OS=$(echo "$OS_INFO" | grep "^ID=" | cut -d= -f2)

# # Check if the distribution is Ubuntu
# if [ $OS = "ubuntu" ]; then
#     ~/.setup-scripts/operating-systems/ubuntu-setup.sh
# fi

# if [ $OS = "debian" ]; then
#     ~/.setup-scripts/operating-systems/debian-setup.sh
# fi

# script_path="/home/${USER}/.setup-scripts/cron-jobs/auto-add-push.sh"
# cron_job="*/10 * * * * $script_path"
# echo "$cron_job" > /tmp/cron_job
# crontab /tmp/cron_job
# rm /tmp/cron_job