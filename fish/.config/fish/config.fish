# Check if the shell is interactive
if status is-interactive
    fish_add_path /Users/phrosa/.local/bin
    fish_add_path "$HOME/.dotfiles/bin"
    fish_add_path /usr/local/bin
    fish_add_path /opt/homebrew/bin  # For Apple Silicon Macs
    fish_add_path /usr/bin
    fish_add_path /bin
    fish_add_path /usr/sbin
    fish_add_path /sbin

    starship init fish | source
    zoxide init fish | source
    set -U fish_greeting
    set -gx EDITOR nvim
    set -Ux PATH ~/.console-ninja/.bin $PATH

end

