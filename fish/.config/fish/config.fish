# Check if the shell is interactive 
if status is-interactive 
    fish_add_path /Users/phrosa/.local/bin
    fish_add_path ~/.local/share/bob/nvim-bin
    fish_add_path "$HOME/.dotfiles/bin"
    fish_add_path /usr/local/bin
    fish_add_path /opt/homebrew/bin  # For Apple Silicon Macs
    fish_add_path /usr/bin
    fish_add_path /bin
    fish_add_path /usr/sbin
    fish_add_path /sbin
    fish_add_path "$HOME/.local/bin"

    starship init fish | source
    set -Ux STARSHIP_CONFIG $HOME/.config/starship/headline.toml

    zoxide init fish | source
    set -U fish_greeting
    set -gx EDITOR nvim
    set -gx PATH ~/.console-ninja/.bin $PATH


end

set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8

#Start Tmux automatically
set -g USE_TMUX false  # Set to true to use tmux or false to disable

if test $USE_TMUX = true
    if type -q tmux
        if not set -q TMUX
            tmux attach || begin
                cd ~
                tmux new-session -s Home
            end
        end
    end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :


