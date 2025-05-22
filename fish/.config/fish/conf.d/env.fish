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
function nvm_default
  set --universal nvm_default_version $argv[1]
  echo "Default Node.js version set to $argv[1]"
end

