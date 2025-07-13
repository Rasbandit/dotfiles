#!/bin/bash
set -euo pipefail
GIT_DIR="$HOME/.cfg"
WORK_TREE="$HOME"
function config() {
    /usr/bin/git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" "$@"
}

# Stage files
config add "$HOME/.setup-scripts/"* "$HOME/.config/autostart/"*
config add -u

# Commit if needed
if [ -n "$(config diff --cached --name-only)" ]; then
    timestamp=$(date +"%Y-%m-%d %H:%M")
    config commit -m "$timestamp"
    
    # Now, and ONLY now, interact with remote (may prompt for unlocking)
    REMOTE_BRANCH="origin/main"
    LOCAL_BRANCH="main"
    # Update remote refs (now that a commit may exist to send)
    config fetch origin +refs/heads/*:refs/remotes/origin/*

    LOCAL_COMMIT=$(config rev-parse "$LOCAL_BRANCH")
    REMOTE_COMMIT=$(config rev-parse "$REMOTE_BRANCH")
    BASE_COMMIT=$(config merge-base "$LOCAL_BRANCH" "$REMOTE_BRANCH")
    if [ "$LOCAL_COMMIT" = "$REMOTE_COMMIT" ]; then
        echo "Local and remote are up to date (after commit)."
    elif [ "$LOCAL_COMMIT" = "$BASE_COMMIT" ]; then
        echo "Need to pull. Unlock SSH key if prompted."
        config pull --ff-only "$REMOTE_BRANCH"
        # You might want to rebase your commit, but that's advanced
    elif [ "$REMOTE_COMMIT" = "$BASE_COMMIT" ]; then
        echo "Pushing local commits after commit."
        config push
    else
        echo "Local and remote have diverged; manual intervention required."
        exit 1
    fi
else
    echo "No local changes to commit or push."
fi