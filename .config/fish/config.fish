
set fish_greeting
set TERM "xterm-256color"
set EDITOR "nano"
set VISUAL "nano"


if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.aliases
source ~/.config/fish/functions/general.fish


if test -f "$HOME/.bash_secrets_Gala Envars"
    source "$HOME/.bash_secrets_Gala Envars"
end

starship init fish | source