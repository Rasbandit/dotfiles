#!/bin/bash

# Add changes to tracked files to the staging area

/usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=$HOME add -u

# Check if there are changes in the staging area
if [ -n "$(/usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=$HOME diff --cached --name-only)" ]; then
    # Generate timestamp in the format YYYY-MM-DD-HH-MM
    timestamp=$(date +"%Y-%m-%d %H:%M")

    # Commit the changes with the specified commit message including the timestamp
    /usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=$HOME commit -m "Commit message - $timestamp"
    # Push the committed changes to the remote repository
    /usr/bin/git --git-dir=/home/rasbandit/.cfg --work-tree=$HOME push
else
    echo "No changes to commit."
fi