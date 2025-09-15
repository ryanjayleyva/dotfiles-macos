#!/usr/bin/env bash

set -euo pipefail

# Logging function
log() {
  printf "\n[%s] %s\n" "$(date +"%H:%M:%S")" "$*"
}

# Verify Homebrew is installed
check_homebrew() {
  if ! command -v brew &>/dev/null; then
    log "ERROR: Homebrew not found. Please run setup.sh first."
    exit 1
  fi
}

# Install GUI apps via Homebrew cask
install_apps() {
  local brew_apps=(
    google-chrome
    keycastr
    microsoft-teams
    raycast
    spotify
    wezterm
    zen
    zoom
  )

  log "Installing GUI apps..."
  for app in "${brew_apps[@]}"; do
    if brew list --cask "$app" &>/dev/null; then
      log "[SKIP] $app already installed."
    else
      log "[INSTALL] $app..."
      brew install --cask "$app"
    fi
  done
  log "GUI apps installation complete."
}

# Entrypoint
main() {
  log "Checking Homebrew..."
  check_homebrew

  log "Updating Homebrew..."
  brew update

  install_apps

  log "RJ dotfiles-macos GUI apps setup completed! 🌴"
}

main "$@"
