#!/bin/bash

touch ~/.bash_secrets

# Check if the distribution is Ubuntu
if [ "$(lsb_release -si)" = "Ubuntu" ]; then
    ~/.setup-scripts/operating-systems/ubuntu-setup.sh
fi

# LATER USE grep -E '^(NAME)=' /etc/os-release 

# Path to your script
# TODO this crontab is not default installed on fedora
script_path="/home/${USER}/.setup-scripts/cron-jobs/auto-add-push.sh"
cron_job="*/10 * * * * $script_path"
echo "$cron_job" > /tmp/cron_job
crontab /tmp/cron_job
rm /tmp/cron_job