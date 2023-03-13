# File system aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias ldir='ls -d */'
alias cdg='cd ~/Documents/gala'
alias sctl='systemctl'

# Kubernetes
alias k='kubectl'
alias e='echo'

# Dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# Alias function
function cjq() {
 cat "$1" | jq
}

# NPM
alias npmr='rm -rf node_modules package-lock.json; npm i'

# git
alias fuck='git reset --soft HEAD^'

# Utils
alias extip='curl icanhazip.com'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias sbrc='source ~/.bashrc'
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias cpu5='ps auxf | sort -nr -k 3 | head -5'

# Apt
alias i='sudo apt install'
alias upd='sudo apt update'
alias upg='upd && sudo apt upgrade'

function create_test_script() {
    touch ./test.sh
    chmod +x ./test.sh
    echo '#!/bin/bash' >> ./test.sh
}
alias cts="create_test_script"

# Do I get added?