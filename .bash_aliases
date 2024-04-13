# File system aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias ldir='ls -d */'
alias sctl='systemctl'
alias edit_aliases='code ~/.bash_aliases'
alias ..='cd ..'
alias cdh='cd ~'
alias c="clear"
alias rm='rm -I --preserve-root'

# Generic
alias e='echo'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Kubernetes
alias k='kubectl'

# Dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias edit_setup='code ~/.setup-scripts'

# Alias function
function cjq() {
 cat "$1" | jq
}

# NPM
alias npmr='rm -rf node_modules package-lock.json; npm i'

# git
alias fuck='git reset --soft HEAD^'

# bash
alias please='sudo $(history -p !!)'

# Utils
alias extip='curl icanhazip.com'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias sbrc='source ~/.bashrc'
alias edit_bashrc='code ~/.bashrc'

# Apt
alias i='sudo apt install'
alias upd='sudo apt update'
alias upg='upd && sudo apt upgrade'

function create_script() {
    local SCRIPT_NAME=${1:-"test"}

    touch ./${SCRIPT_NAME}.sh
    chmod +x ./${SCRIPT_NAME}.sh
    echo '#!/bin/bash' >> ./${SCRIPT_NAME}.sh
    code ./${SCRIPT_NAME}.sh
}
alias cs="create_script"

function docker_build_publish() {
    local REGISTRY_URL=${1}
    local IMAGE_NAME=${2}
    local TAG=${3}
    local DOCKER_FILE=${4:-"Dockerfile"}

    docker build . -f ${DOCKER_FILE} -t ${IMAGE_NAME}:${TAG}
    docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY_URL}:${TAG}
    docker push ${REGISTRY_URL}:${TAG}
}
alias dbp="docker_build_publish"

# VPN
alias nrd='nordvpn'
alias nrdc='nordvpn connect'
alias nrdct='nordvpn connect Tokyo'
alias nrdd='nordvpn disconnect'
alias nrds='nordvpn status'

alias wgq='wg-quick'
alias wguh='sudo wgq up home'
alias wgdh='sudo wgq down home'