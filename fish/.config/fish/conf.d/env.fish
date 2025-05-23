# asdf
fish_add_path $HOME/.asdf/bin
fish_add_path $HOME/.asdf/shims

# Homebrew
set -gx PATH /opt/homebrew/bin $PATH
set -gx GPG_TTY (tty)
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/icu4c/lib/pkgconfig"

# Herd PHP paths
fish_add_path "/Users/phrosa/Library/Application Support/Herd/bin/"
set -gx HERD_PHP_84_INI_SCAN_DIR "/Users/phrosa/Library/Application Support/Herd/config/php/84/"

# Bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path "$PNPM_HOME"

# yarn
set -gx YARN_HOME "$HOME/.yarn"
fish_add_path "$YARN_HOME/bin"

# Python 
set -gx PATH "$HOME/.asdf/installs/python/3.13.2/bin" $PATH

# Set up for tcl-tk
set -x LDFLAGS "-L/opt/homebrew/opt/tcl-tk/lib"
set -x CPPFLAGS "-I/opt/homebrew/opt/tcl-tk/include"
set -x PKG_CONFIG_PATH "/opt/homebrew/opt/tcl-tk/lib/pkgconfig"
set -x PATH /opt/homebrew/opt/tcl-tk/bin $PATH


# NVM FISHER
# fisher install jorgebucaran/nvm.fish
abbr -a nvm_dir "echo "x" > .nvmrc"

function nvm_default
  set --universal nvm_default_version $argv[1]
  echo "Default Node.js version set to $argv[1]"
end

function __load_nvmrc --on-variable PWD
  if test -f .nvmrc
    set -l nvmrc_version (string trim < .nvmrc)
    set -l current_version (nvm current 2>/dev/null)

    if test "$nvmrc_version" != "$current_version"
      nvm use $nvmrc_version > /dev/null 2>&1
    end
  else
    set -l default_version (nvm default 2>/dev/null)
    set -l current_version (nvm current 2>/dev/null)

    if test "$default_version" != "$current_version"
      nvm use default > /dev/null 2>&1
    end
  end
end

functions -c nvm __original_nvm

function nvm
  if test (count $argv) -eq 2 -a "$argv[1]" = "use"
    if test "$argv[2]" != "default"
      set node_version $argv[2]
      echo $node_version > .nvmrc

      if not test -e .gitignore
        echo ".nvmrc" > .gitignore
      else
        set found (grep -Fx ".nvmrc" .gitignore 2> /dev/null)
        if test -z "$found"
          echo ".nvmrc" >> .gitignore
        end
      end
    end
  end

  __original_nvm $argv > /dev/null 2>&1
end
