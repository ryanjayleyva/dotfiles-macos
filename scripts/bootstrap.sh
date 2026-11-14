#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles-macos"
DOTFILES_REPO="https://github.com/ryanjayleyva/dotfiles-macos.git"

check_platform() {
  if [[ "$(uname -s)" != Darwin || "$(uname -m)" != arm64 ]]; then
    printf '%s\n' 'Unsupported platform: Apple Silicon only' >&2
    exit 1
  fi
}

is_installed() {
  command -v "$1" &>/dev/null
}

load_homebrew() {
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

install_homebrew() {
  if ! is_installed brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  load_homebrew
}

clone_dotfiles() {
  if [[ ! -d "$DOTFILES_DIR" ]]; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
  fi
}

trust_qmk() {
  local tap

  for tap in qmk/qmk osx-cross/arm osx-cross/avr; do
    brew tap "$tap"
    brew trust --tap "$tap"
  done

  brew trust --formula qmk/qmk/qmk
}

install_brewfile() {
  brew bundle --file="$DOTFILES_DIR/Brewfile"
}

install_uv() {
  if is_installed uv; then
    return
  fi

  curl -LsSf https://astral.sh/uv/install.sh | sh
}

install_rust() {
  if ! is_installed rustup; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # shellcheck disable=SC1091
    source "$HOME/.cargo/env"
  fi

  rustup component add rustfmt
}

link_dotfiles() {
  (cd "$DOTFILES_DIR" && stow .)
}

check_platform
install_homebrew
clone_dotfiles
trust_qmk
install_brewfile
install_uv
install_rust
link_dotfiles
