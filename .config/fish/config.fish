
set fish_greeting
set TERM "xterm-256color"
set EDITOR "nano"
set VISUAL "nano"


if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.aliases
source ~/.config/fish/functions/general.fish

if test -f "$HOME/.config/fish/work_secrets"
    source "$HOME/.config/fish/work_secrets"
end

# ~/.config/fish/config.fish
# You must call it on initialization or listening to directory switching won't work
# load_nvm > /dev/stderr

starship init fish | source