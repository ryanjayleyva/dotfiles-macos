# RJ dotfiles-macos – Quick Installation 🌴

## One-Liner Install

```bash
ARCH="$(uname -m)"; BREW_PREFIX="/opt/homebrew"; [ "$ARCH" != "arm64" ] && BREW_PREFIX="/usr/local"
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
grep -q "brew shellenv" "$HOME/.zprofile" 2>/dev/null || echo "eval \"\$($BREW_PREFIX/bin/brew shellenv)\"" >> "$HOME/.zprofile"
eval "$($BREW_PREFIX/bin/brew shellenv)"
brew tap homebrew/cask-fonts
brew install stow node git neovim tmux lua-language-server marksman go python pipx \
            ripgrep bat black isort codespell shfmt stylua yq zoxide \
            zsh-autosuggestions delta zsh-syntax-highlighting powerlevel10k eza tlrc
brew install --cask font-lilex-nerd-font
go list -m golang.org/x/tools/gopls >/dev/null 2>&1 || go install golang.org/x/tools/gopls@latest
command -v goimports >/dev/null 2>&1 || go install golang.org/x/tools/cmd/goimports@latest
npm install -g @olrtg/emmet-language-server @vtsls/language-server @astrojs/language-server \
              svelte-language-server eslint_d prettier pyright \
              graphql-language-service-cli vscode-langservers-extracted \
              yaml-language-server typescript
git clone https://github.com/ryanjayleyva/dotfiles-macos.git "$HOME/dotfiles-macos" || true
cd "$HOME/dotfiles-macos" && stow .
command -v bat >/dev/null 2>&1 && bat cache --build
```

or Run the Setup Script

```bash
/bin/bash -c "$(curl -fsSL https://gitea.com/rjleyva/dotfiles-macos/raw/branch/main/scripts/dev-setup.sh)"
```

This will:

- Install Homebrew (Apple Silicon ready) and add it to your path.
- Install core development tools such as Neovim, tmux, Lua and Marksman language servers, Python and formatters.
- Install global npm language servers.
- Clone this repository into ~/dotfiles-macos and symlink configs with Stow.

## Usage

```bash
# Remove symlinks (safe, non-destructive)
stow -D .
```

```bash
# Symlink selectively
stow zsh git nvim
```

Defaults are opinionated but minimal. Adjust to your needs.

### Bat Configuration Reminder

After installing `bat` rebuild the syntax and theme cache

```bash
bat cache --build
```

## TMUX Configuration

Tmux works out of the box with this configuration.  
No additional plugin manager or setup is required.

### Keymaps

The configuration includes custom keymaps for a smoother workflow:

```tmux
# Prefix remap
set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

# Splits
bind | split-window -h
bind - split-window -v

# Reload config
bind r source-file ~/.config/tmux/tmux.conf \; display-message "Tmux config reloaded"

# Pane resizing
bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r h resize-pane -L 5
bind -r l resize-pane -R 5
bind -r m resize-pane -Z

# Copy mode (Vim-like)
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send -X copy-selection
```

- Prefix remapped to `Ctrl-a`
- Vim style splits and pane navigation
- Quick reload with `Ctrl-a r`
- Resize panes with Vim keys (h, j, k, l)
- Copy mode is Vim-like for consistency

## Troubleshooting

### Stow conflicts (existing dotfiles)

If you encounter the message existing target is not a symlink back up and remove the old configuration before
running Stow again

```bash
mv ~/.zshrc ~/.zshrc.backup
stow zsh
```

### Homebrew not found

Make sure your shell environment has been updated

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### npm command not found

Confirm that Node has been installed with brew install node then restart your shell

### Rollback

To remove all symlinks, uninstall the packages, and delete this repository run

```bash
cd "$HOME/dotfiles-macos" && stow -D . && cd "$HOME"
npm uninstall -g @olrtg/emmet-language-server @vtsls/language-server @astrojs/language-server \
                 svelte-language-server eslint_d prettier pyright \
                 graphql-language-service-cli vscode-langservers-extracted \
                 yaml-language-server typescript || true
brew uninstall --ignore-dependencies stow node git neovim tmux lua-language-server marksman go python pipx \
                               ripgrep bat black isort codespell shfmt stylua yq zoxide \
                               zsh-autosuggestions delta zsh-syntax-highlighting \
                               powerlevel10k eza tlrc || true
brew uninstall --cask font-lilex-nerd-font || true
rm -f "$(go env GOPATH)/bin/gopls" "$(go env GOPATH)/bin/goimports" || true
rm -rf "$HOME/dotfiles-macos"
brew autoremove -q || true
brew cleanup -q || true
```

That completes the process from zero to a full environment in under five minutes.
For further reference including demonstrations, see [Editor Worflow](../docs/editor-workflow.md).
