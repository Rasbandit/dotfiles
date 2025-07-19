#!/bin/bash
set -euo pipefail

GIT_DIR="$HOME/.cfg"
WORK_TREE="$HOME"

# Helper function to run git for the bare dotfiles repo
config() {
    /usr/bin/git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" "$@"
}

REMOTE_BRANCH="origin/main"
LOCAL_BRANCH="main"

# --- Ensure correct remote URLs for push/pull ---
# Set HTTPS URL for fetch/pull, SSH for push
config remote set-url origin https://github.com/Rasbandit/dotfiles.git
config remote set-url --push origin git@github.com:Rasbandit/dotfiles.git

# --- 1. Pull remote changes first (will not prompt for SSH unlock if repo is public) ---
config pull
config fetch origin +refs/heads/*:refs/remotes/origin/*

LOCAL_COMMIT=$(config rev-parse "$LOCAL_BRANCH")
REMOTE_COMMIT=$(config rev-parse "$REMOTE_BRANCH")
BASE_COMMIT=$(config merge-base "$LOCAL_BRANCH" "$REMOTE_BRANCH")

if [ "$LOCAL_COMMIT" = "$REMOTE_COMMIT" ]; then
    echo "Local and remote are up to date."
elif [ "$LOCAL_COMMIT" = "$BASE_COMMIT" ]; then
    echo "Pulling new changes from remote main (no SSH key required)..."
    config pull --ff-only "$REMOTE_BRANCH"
elif [ "$REMOTE_COMMIT" = "$BASE_COMMIT" ]; then
    echo "Local ahead; will push any new commits after staging."
else
    notify-send "Dotfiles backup ERROR" "Branches have diverged! Manual intervention required."
    echo "Branches have diverged! Manual intervention required."
    exit 1
fi

# --- 2. Stage your dotfiles and config changes ---
config add "$HOME/.setup-scripts/"* "$HOME/.config/autostart/"*
config add -u

# --- 3. Commit if needed, then push (this will require SSH key unlock if needed) ---
if [ -n "$(config diff --cached --name-only)" ]; then
    timestamp=$(date +"%Y-%m-%d %H:%M")
    config commit -m "$timestamp"
    echo "Pushing new commit to remote main (this will require your SSH key)..."
    config push
else
    echo "No local changes to commit or push."
fi