#!/bin/bash

touch ~/.bash_secrets

./other-installs/fonts.sh

OS_INFO=$(cat /etc/os-release)

OS=$(echo "$OS_INFO" | grep "^ID=" | cut -d= -f2)

# Check if the distribution is Ubuntu
if [ $OS = "ubuntu" ]; then
    ~/.setup-scripts/operating-systems/ubuntu-setup.sh
fi

if [ $OS = "debian" ]; then
    ~/.setup-scripts/operating-systems/debian-setup.sh
fi

script_path="/home/${USER}/.setup-scripts/cron-jobs/auto-add-push.sh"
cron_job="* */1 * * * $script_path"
echo "$cron_job" > /tmp/cron_job
crontab /tmp/cron_job
rm /tmp/cron_job