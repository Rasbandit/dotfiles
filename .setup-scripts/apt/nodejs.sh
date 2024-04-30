#!/bin/bash

if [ "$SHELL" = "/usr/bin/fish" ]; then
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
elif [ "$SHELL" = "/bin/bash" ] || [ "$SHELL" = "/usr/bin/bash" ]; then
    sudo apt update
    ## Todo always get latest
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
else
    echo "Current shell is neither Fish nor Bash"
fi