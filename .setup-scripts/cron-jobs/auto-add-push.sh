#!/bin/bash

/usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=/home/rasbandit pull

/usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=/home/rasbandit add -u

# Check if there are changes in the staging area
if [ -n "$(/usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=/home/rasbandit diff --cached --name-only)" ]; then
    # Generate timestamp in the format YYYY-MM-DD-HH-MM
    timestamp=$(date +"%Y-%m-%d %H:%M")

    # Commit the changes with the specified commit message including the timestamp
    /usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=/home/rasbandit commit -m "$timestamp"
    # Push the committed changes to the remote repository
    /usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=/home/rasbandit push
else
    echo "No changes to commit."
fi