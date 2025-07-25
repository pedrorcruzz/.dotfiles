### License

This repository is licensed under the [MIT License](LICENSE).

## About
Welcome to my personal dotfiles repository, where I manage all my configuration files using [GNU Stow](https://www.gnu.org/software/stow/). This setup allows me to maintain a clean and organized home directory while making it easy to apply my preferred configurations across different machines.

### Usage
Follow these steps to use this repository and apply the configurations:

1. **Install GNU Stow**:

    On Ubuntu:
    ```bash
    sudo apt install stow
    ```
    On macOS:
    ```bash
    brew install stow
    ```

2. **Clone the repository**:
    ```bash
    git clone https://github.com/pedrorcruzz/.dotfiles.git
    ```

2.5 **Remove existing configuration files (if necessary):** 
Before applying the configurations, ensure that the original files are removed to avoid conflicts:

Example:

```bash

rm -rf ~/.config/nvim \
       ~/.zshrc \
       ~/.gitconfig \
       ~/.tmux.conf \
       ~/.config/fastfetch \
       ~/.config/yabai \
       ~/.config/skhd \
       ~/.config/starship \
       ~/.config/wezterm \
       ~/.config/fish \
       ~/.config/yazi \
       ~/.config/posting \
       ~/.config/lazygit \
       ~/.hushlogin \
       ~/.config/ghostty \
       ~/.config/ghostty/Library/Application\ Support/com.mitchellh.ghostty \
       ~/.config/lazygit/Library/Application\ Support/lazygit \
```

3. **Navigate to the .dotfiles directory**:
    ```bash
    cd .dotfiles
    ```

4. **Apply configurations**:
     To apply a specific configuration, run:

    ```bash
    stow <directory>
    ```

    Example: Apply Neovim
    ```bash
    stow nvim
    ```

6. **Apply all configurations at once**:
    ```bash
    stow -t ~ .
    ```

**REMEMBER:** Some configs, like `.zshrc` and `.gitconfig`, are set with my name, so just change it to yours.
