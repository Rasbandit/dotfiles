#!/bin/bash
set -euo pipefail

GIT_DIR="$HOME/.cfg"
WORK_TREE="$HOME"

function config() {
    /usr/bin/git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" "$@"
}

REMOTE_BRANCH="origin/main"
LOCAL_BRANCH="main"

# Correct: update remote refs for a bare repo
config fetch origin +refs/heads/*:refs/remotes/origin/*

LOCAL_COMMIT=$(config rev-parse "$LOCAL_BRANCH")
REMOTE_COMMIT=$(config rev-parse "$REMOTE_BRANCH")
BASE_COMMIT=$(config merge-base "$LOCAL_BRANCH" "$REMOTE_BRANCH")

if [ "$LOCAL_COMMIT" = "$REMOTE_COMMIT" ]; then
    echo "Local and remote are up to date."
elif [ "$LOCAL_COMMIT" = "$BASE_COMMIT" ]; then
    echo "Need to pull. Unlock SSH key if prompted."
    config pull --ff-only "$REMOTE_BRANCH"
elif [ "$REMOTE_COMMIT" = "$BASE_COMMIT" ]; then
    echo "Need to push but not pull. Will handle after commit."
    # Will push after committing if needed.
else
    echo "Local and remote have diverged; manual intervention required."
    exit 1
fi

# 2. Stage files
config add "$HOME/.setup-scripts/"* "$HOME/.config/autostart/"*
config add -u

# 3. Commit if needed
if [ -n "$(config diff --cached --name-only)" ]; then
    timestamp=$(date +"%Y-%m-%d %H:%M")
    config commit -m "$timestamp"
    # 4. Push new commits
    config push
else
    echo "No local changes to commit or push."
fi