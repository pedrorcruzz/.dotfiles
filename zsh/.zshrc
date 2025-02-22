export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/bin:$PATH"


# ZSH_THEME="headline"

# plugins oh my zsh 
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Starship 
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/headline.toml


# CONSOLE NINJA 
PATH=~/.console-ninja/.bin:$PATH


# completion using arrow keys (based on history)
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward

# iniciar o tmux
# if command -v tmux &> /dev/null; then
#     if [ -z "$TMUX" ]; then
#         tmux attach || (cd ~ && tmux new-session -s Workspace)
#     fi
# fi


#Alias Directory
alias D="~/Workspace"
alias S="~/Workspace/Studies"
alias C="~/Workspace/Cesmac"
alias P="~/Workspace/Projects"
alias PP="~/Workspace/Projects/Personal/"
alias PW="~/Workspace/Projects/Work/"
alias PH="/Applications/XAMPP/xamppfiles/htdocs/projects"


#Alias Postgresql
#Usuario Postgres
alias joinpostgresp='psql -U postgres -d postgres'
alias joindpostgresp='docker exec -it postgres-container psql -U postgres -d postgres'

#Digitar Usario
alias joinpostgres='psql -U'
alias joindpostgres='docker exec -it postgres-container psql -U'
export LC_MESSAGES=en_US.UTF-8

#Alias MongoDB
alias joinmongo='mongosh -u phrosa -p mongo --authenticationDatabase admin'

#Alias System
alias rn="nvim"
alias rfswap="rm -rf ~/.local/state/nvim/swap/*"
alias c='clear'
alias live='live-server'
alias ff='pushd $(pwd) > /dev/null && cd ~/.config/fastfetch && fastfetch && popd > /dev/null'
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="lvim ~/.zshrc"
alias lg='lazygit'
alias ldc='lazydocker'
alias sv='source venv/bin/activate'
alias dv='deactivate'


#Python
alias pipu='pip install --upgrade pip'
alias pyvenv='python3 -m venv venv'


#Alias Docker
alias ldk='lazydocker'
# alias start_project="cd /caminho/do/projeto && docker compose up"


#Alias Git
alias gcn="git clone"


#Alias Tmux
alias tls="tmux list-sessions"
alias TH="tmux attach-session -t home"
alias TN="tmux new-session -s home "
alias tas="tmux attach-session -t "
alias tda="tmux detach"
alias taw="tmux attach-session -t Home || tmux new-session -s Home"
alias tnn="tmux new-session -s "
alias tks="tmux kill-session -t "



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

# ---- TheFuck -----

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

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


# Dependências de programação 

# node
#Homebrew
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Se for pelo curl
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/danielmac/Library/pnpm"
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


# ruby
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/opt/homebrew/opt/ripgrep/bin:$PATH"


# python
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"
eval "$(pyenv init -)"

# JAVA 
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"



# Postgresql
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"



# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/phrosa/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/phrosa/Library/Application Support/Herd/bin/":$PATH

