export PATH="/usr/local/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig"
export GPG_TTY=$(tty)




# plugins zsh 
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# oh my zsh
plugins=(git)
# ZSH_THEME="headline"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Starship 
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/zen.toml

# iniciar o tmux
# if command -v tmux &> /dev/null; then
#     if [ -z "$TMUX" ]; then
#         tmux attach || (cd ~ && tmux new-session -s Workspace)
#     fi
# fi


#Alias Directory
alias W="~/Workspace"
alias S="~/Workspace/Studies"
alias SRC="~/Workspace/Scripts"
alias C="~/Workspace/Cesmac"
alias P="~/Workspace/Projects"
alias PP="~/Workspace/Projects/Personal/"
alias PW="~/Workspace/Projects/Work/"
alias PH="/Applications/XAMPP/xamppfiles/htdocs/projects"

#Alias Scripts
alias syo='pushd "$(pwd)" > /dev/null && cd ~/.dotfiles/scripts && ./obsidian-sync.sh && popd > /dev/null'
alias syd='pushd "$(pwd)" > /dev/null && cd ~/.dotfiles/scripts && ./dotfiles-sync.sh && popd > /dev/null'
alias ccache='pushd "$(pwd)" > /dev/null && cd ~/.dotfiles/scripts && ./clear-cache.sh && popd > /dev/null'

#Alias Postgresql
#Start and Stop Postgres
alias startpg="/Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data start"
alias stoppg="/Users/phrosa/.asdf/installs/postgres/17.4/bin/pg_ctl -D /Users/phrosa/.asdf/installs/postgres/17.4/data stop"

#User Postgres
alias joinpgp='psql -U postgres -d postgres'
alias joindpgp='docker exec -it postgres-container psql -U postgres -d postgres'

#Input User
alias joinpg='psql -U'
alias joindpg='docker exec -it postgres-container psql -U'
export LC_MESSAGES=en_US.UTF-8

#Alias MongoDB
alias startmongo='mongod --dbpath ~/.asdf/installs/mongodb/8.0.5/data/db'
alias startmongod='mongod --dbpath ~/.asdf/installs/mongodb/8.0.5/data/db --fork --logpath ~/.asdf/installs/mongodb/8.0.5/mongo_logs/mongo.log'
alias stopmongo= 'ps aux | grep mongod'
alias joinmongo='mongosh -u phrosa -p mongo --authenticationDatabase admin'

#Alias System
alias rn="nvim"
alias rfswap="rm -rf ~/.local/state/nvim/swap/*"
alias c='clear'
alias live='live-server'
alias ghosttyconfig='pushd "$(pwd)" > /dev/null && cd ~/Library/Application\ Support/com.mitchellh.ghostty/ && nvim config && popd > /dev/null'
alias ff='pushd $(pwd) > /dev/null && cd ~/.config/fastfetch && fastfetch && popd > /dev/null'
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="lvim ~/.zshrc"
alias lg='lazygit'
alias ldc='lazydocker'
alias sv='source venv/bin/activate'
alias dv='deactivate'
# alias cleacache='pushd "$(pwd)" > /dev/null && cd ~/Workspace/Scripts/nuke-macOS-caches && make run && clear && popd > /dev/null'

#Alias Python
alias pipu='pip install --upgrade pip'
alias pyvenv='python3 -m venv venv'

#Alias Docker
alias start_project="cd /caminho/do/projeto && docker compose up"

#Alias Git CLI
alias gh-c-pri='git add . && git commit -m "chore: upload project to GitHub" && gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'
alias gh-c-pub='git add . && git commit -m "chore: upload project to GitHub" && gh repo create --public --source=. --remote=origin && git push -u --all && gh browse'
alias gh-c-pri-w='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'
alias gh-c-pub-w='gh repo create --public --source=. --remote=origin && git push -u --all && gh browse'

#Alias Git 
alias gcn="git clone"
alias gcmsg="git commit -m"
alias gcmsgs="git commit -S -m"
alias gtag="git tag -a"
alias gtagp="git push origin"
alias gtagpa="git push origin --tags"
alias gtagd="git tag -d"
alias gtagdr="git push origin --delete refs/tags/"
alias gbdr="git push origin --delete"

#Alias Tmux
alias tls="tmux list-sessions"
alias TH="tmux attach-session -t home"
alias TN="tmux new-session -s home "
alias tas="tmux attach-session -t "
alias tda="tmux detach"
alias taa="tmux attach-session -t Home || tmux new-session -s Home"
alias tnn="tmux new-session -s "
alias tks="tmux kill-session -t "



# Alias Games
alias stardew='cd ~/Library/Application\ Support/Steam/steamapps/common/Stardew\ Valley/Contents/MacOS && ./StardewModdingAPI'

# ----- Bat (better cat) -----
alias cat="bat"

# ---- Eza (better ls) -----

alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "  

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

# yazi
export EDITOR="nvim"
alias y ="yazi"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# Node Version Manager
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/phrosa/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# yarn
export YARN_HOME="$HOME/.yarn"
case ":$PATH:" in
  *":$YARN_HOME/bin:"*) ;;
  *) export PATH="$YARN_HOME/bin:$PATH" ;;
esac


# Stacks Managers

# ASDF
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/.asdf/installs/python/3.13.2/bin:$PATH"



# NVM 
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# GOENV
# export GOENV_ROOT="$HOME/.goenv"
# export PATH="$GOENV_ROOT/bin:$PATH"
# eval "$(goenv init -)"
# export PATH="$GOENV_ROOT/shims:$PATH"

# RBENV
# export PATH="$HOME/.rbenv/shims:$PATH"
# export PATH="/opt/homebrew/opt/ripgrep/bin:$PATH"


# PYENV
# export PATH="$HOME/.pyenv/bin:$PATH"
# export PATH="$(pyenv root)/shims:$PATH"
# eval "$(pyenv init -)"


# SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Postgresql with homebrew
# export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

# Herd injected PHP binary.
export PATH="/Users/phrosa/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/phrosa/Library/Application Support/Herd/config/php/84/"

PATH=~/.console-ninja/.bin:$PATH
