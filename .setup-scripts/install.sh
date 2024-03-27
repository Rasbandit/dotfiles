#!/bin/bash


# Check if the distribution is Ubuntu
if [ "$(lsb_release -si)" = "Ubuntu" ]; then
    ~/.setup-scripts/operating-systems/ubuntu-setup.sh
fi

# Path to your script
script_path="/home/${USER}/.setup-scripts/cron-jobs/auto-add-push.sh"
cron_job="*/10 * * * * $script_path"
echo "$cron_job" > /tmp/cron_job
crontab /tmp/cron_job
rm /tmp/cron_job