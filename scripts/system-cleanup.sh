#!/usr/bin/env bash

set -euo pipefail

# Logging function
log() { printf "\n[%s] %s\n" "$(date +"%H:%M:%S")" "$*"; }

# Cleanup cache, logs, and history files
cleanup_system() {
  log "Removing common cache, logs, and history files..."

  local targets=(
    "$HOME/.cache"
    "$HOME/.DS_Store"
    "$HOME/.zsh_history"
    "$HOME/.bash_history"
    "$HOME/.python_history"
    "$HOME/.mysql_history"
    "$HOME/.psql_history"
    "$HOME/.lesshst"
    "$HOME/.viminfo"
    "$HOME/.vim/swap"
    "$HOME/.vim/backup"
    "$HOME/.npm"
    "$HOME/.pnpm"
    "$HOME/.yarn"
    "$HOME/.bun"
    "$HOME/Library/Caches/Homebrew"
    "$HOME/Library/Logs/Homebrew"
  )

  for target in "${targets[@]}"; do
    if [[ -e "$target" ]]; then
      rm -rf "$target"
      log "[REMOVED] $target"
    else
      log "[SKIP] $target not found."
    fi
  done
}

# Entrypoint
main() {
  log "Starting system cleanup..."
  cleanup_system
  log "System cleanup complete! 🌴"
}

main "$@"
