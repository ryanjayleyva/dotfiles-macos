#!/usr/bin/env bash

set -euo pipefail

# Logging function
log() { printf "\n[%s] %s\n" "$(date +"%H:%M:%S")" "$*"; }

# Check if Homebrew is installed
check_homebrew() {
  if ! command -v brew &>/dev/null; then
    log "Homebrew not found. Please run setup.sh first."
    exit 1
  fi
}

# Update Homebrew
update_homebrew() {
  log "Updating Homebrew..."
  brew update
}

# Upgrade installed packages
upgrade_packages() {
  log "Upgrading installed packages..."
  brew upgrade
}

# Cleanup old packages and cache
cleanup_homebrew() {
  log "Cleaning up old versions..."
  brew cleanup -s || true

  log "Removing unused dependencies..."
  brew autoremove -q || true

  local cache_dir="${HOMEBREW_CACHE:-$HOME/Library/Caches/Homebrew}"
  if [[ -d "$cache_dir" ]]; then
    log "Clearing Homebrew cache at $cache_dir..."
    rm -rf "$cache_dir"/*
  fi
}

# Entrypoint
main() {
  log "Starting Homebrew maintenance..."
  check_homebrew
  update_homebrew
  upgrade_packages
  cleanup_homebrew
  log "Homebrew maintenance complete! 🌴"
}

main "$@"
