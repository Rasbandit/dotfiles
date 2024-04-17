#!/bin/bash

# touch ~/.bash_secrets

OS_INFO=$(cat /etc/os-release)

# Use grep to filter out the line containing ID= and then use cut to extract the value
OS=$(echo "$OS_INFO" | grep "^ID=" | cut -d= -f2)

# Print the value of the ID variable
echo "$id"

# Check if the distribution is Ubuntu
if [ $OS = "ubuntu" ]; then
    ~/.setup-scripts/operating-systems/ubuntu-setup.sh
fi

if [ $OS = "debian" ]; then
    ~/.setup-scripts/operating-systems/debian-setup.sh
fi

script_path="/home/${USER}/.setup-scripts/cron-jobs/auto-add-push.sh"
cron_job="*/10 * * * * $script_path"
echo "$cron_job" > /tmp/cron_job
crontab /tmp/cron_job
rm /tmp/cron_job