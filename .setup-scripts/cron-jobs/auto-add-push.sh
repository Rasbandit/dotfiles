#!/bin/bash

function config() {
    /usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=/home/rasbandit $@
}

config pull

config add /home/rasbandit/.setup-scripts/**/*

config add -u

# Check if there are changes in the staging area
if [ -n "$(config diff --cached --name-only)" ]; then
    # Generate timestamp in the format YYYY-MM-DD-HH-MM
    timestamp=$(date +"%Y-%m-%d %H:%M")

    # Commit the changes with the specified commit message including the timestamp
    /usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=/home/rasbandit commit -m "$timestamp"
    # Push the committed changes to the remote repository
    config push
else
    echo "No changes to commit."
fi