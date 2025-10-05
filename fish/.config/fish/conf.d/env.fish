# asdf
fish_add_path $HOME/.asdf/bin
fish_add_path $HOME/.asdf/shims
set -Ux GLIBC_TUNABLES glibc.pthread.rseq=0

set -U fish_user_paths /opt/homebrew/opt/libpq/bin $fish_user_paths

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


if test -f "$HOME/.tool-versions"
  for line in (cat "$HOME/.tool-versions")
    if string match -qr '^python ' -- $line
      set py_version (string split " " -- $line)[2]
      set py_bin "$HOME/.asdf/installs/python/$py_version/bin"
      if test -d "$py_bin"
        fish_add_path "$py_bin"
      end
    end
  end
end


if test -f "$HOME/.tool-versions"
  for line in (cat "$HOME/.tool-versions")
    if string match -qr '^golang ' -- $line
      set go_version (string split " " -- $line)[2]
      set go_bin "$HOME/.asdf/installs/golang/$go_version/bin"
      if test -d "$go_bin"
        fish_add_path "$go_bin"
      end
    end
  end
end

# Set up for tcl-tk
set -x LDFLAGS "-L/opt/homebrew/opt/tcl-tk/lib"
set -x CPPFLAGS "-I/opt/homebrew/opt/tcl-tk/include"
set -x PKG_CONFIG_PATH "/opt/homebrew/opt/tcl-tk/lib/pkgconfig"
set -x PATH /opt/homebrew/opt/tcl-tk/bin $PATH


