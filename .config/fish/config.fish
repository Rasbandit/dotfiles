
set fish_greeting
set TERM "xterm-256color"
set EDITOR "nano"
set VISUAL "nano"


if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source