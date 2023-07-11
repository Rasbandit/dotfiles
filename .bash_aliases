# File system aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias ldir='ls -d */'
alias sctl='systemctl'
alias edit_aliases='code ~/.bash_aliases'

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
    code ./test.sh
}
alias cts="create_test_script"

function docker_build_publish() {
    local REGISTRY_URL=${1:-REGISTRY_URL}
    local IMAGE_NAME=${2:-IMAGE_NAME}
    local TAG=${3}

    docker build . -t ${IMAGE_NAME}:${TAG}
    docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY_URL}:${TAG}
    docker push ${REGISTRY_URL}:${TAG}
}
alias dbp="docker_build_publish"