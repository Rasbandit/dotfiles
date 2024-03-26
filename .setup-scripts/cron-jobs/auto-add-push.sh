#!/bin/bash

function config() {
    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME "$@"
}

config pull

config add $HOME/.setup-scripts/*

config add -u

# Check if there are changes in the staging area
if [ -n "$(config diff --cached --name-only)" ]; then
    # Generate timestamp in the format YYYY-MM-DD-HH-MM
    timestamp=$(date +"%Y-%m-%d %H:%M")

    # Commit the changes with the specified commit message including the timestamp
    config commit -m "$timestamp"
    # Push the committed changes to the remote repository
    config push
else
    echo "No changes to commit."
fi