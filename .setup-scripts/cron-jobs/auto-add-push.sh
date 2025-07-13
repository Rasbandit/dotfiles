#!/bin/bash
set -euo pipefail

GIT_DIR="$HOME/.cfg"
WORK_TREE="$HOME"

function config() {
    /usr/bin/git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" "$@"
}

# Stage desired files
config add "$HOME/.setup-scripts/"* "$HOME/.config/autostart/"*
config add -u

# Did we stage anything?
if [ -n "$(config diff --cached --name-only)" ]; then
    # Local changes exist — we may need SSH soon!
    timestamp=$(date +"%Y-%m-%d %H:%M")
    config commit -m "$timestamp"

    # Check if our push is clean without unlocking SSH (safe; dry-run)
    if ! config push --dry-run 2>&1 | grep -q 'Everything up-to-date'; then
        echo "There are local commits to push. (This will require unlocking your SSH key!)"
        # At this point, you can prompt to unlock your vault, or just run the push and let it prompt
        config push
    else
        echo "Nothing to push to remote."
    fi
else
    # No local changes. See if there's anything to pull (without SSH key first)
    echo "No changes to commit."
    # Use ls-remote to check for upstream changes without authentication if they're public, or you can try to fetch and see if that triggers unlock.
    # Most likely, for private repos, you'll need to unlock to check, so you could skip pull if you don't want to be prompted needlessly.
    # Uncomment the following to skip pull when no local changes:
    # exit 0

    # Or use a fast-forward-only pull to avoid conflict/merge in cron context
    # You could also run:
    # if config fetch --dry-run | grep -q '[^ ]'; then
    #     echo "There are upstream changes to pull. (This will require unlocking your SSH key!)"
    #     config pull --ff-only
    # else
    #     echo "No upstream changes to pull."
    # fi
fi