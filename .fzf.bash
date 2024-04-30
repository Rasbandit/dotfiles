# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rasbandit/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/rasbandit/.fzf/bin"
fi

eval "$(fzf --bash)"
