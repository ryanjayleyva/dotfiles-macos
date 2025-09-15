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

# Uninstall GUI apps via Homebrew cask
uninstall_apps() {
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

  log "Uninstalling GUI apps..."
  for app in "${brew_apps[@]}"; do
    if brew list --cask "$app" &>/dev/null; then
      log "[REMOVE] $app..."
      brew uninstall --cask "$app" || true
    else
      log "[SKIP] $app not found."
    fi
  done
  log "GUI apps uninstall complete."
}

# Cleanup Homebrew
cleanup_brew() {
  log "Cleaning up Homebrew..."
  brew autoremove -q || true
  brew cleanup -q || true
}

# Entrypoint
main() {
  log "Checking Homebrew..."
  check_homebrew

  uninstall_apps
  cleanup_brew

  log "RJ dotfiles-macos GUI apps rollback completed! 🌴"
}

main "$@"
