#!/bin/bash

git clone --bare https://github.com/Rasbandit/dotfiles.git $HOME/.cfg

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

mkdir -p .config-backup
config checkout -f
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

config checkout
config config status.showUntrackedFiles no

config remote set-url origin git@github.com:Rasbandit/dotfiles.git
config push --set-upstream origin main

$HOME/.setup-scripts/install.sh
