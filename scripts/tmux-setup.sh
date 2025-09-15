#!/usr/bin/env bash

set -euo pipefail

# Logging function
log() { printf "\n[%s] %s\n" "$(date +"%H:%M:%S")" "$*"; }

SESSION="dev"

# Ensure tmux is installed
check_tmux() {
  if ! command -v tmux >/dev/null 2>&1; then
    log "ERROR: tmux is not installed. Please run setup.sh first."
    exit 1
  fi
}

# Create tmux session with predefined layout
create_session() {
  if tmux has-session -t "$SESSION" 2>/dev/null; then
    log "[SKIP] tmux session '$SESSION' already exists."
    return
  fi

  log "Creating tmux session '$SESSION'..."
  tmux new-session -d -s "$SESSION" -n main

  local top_left=0

  # Split top-left horizontally to create right pane (10% width)
  tmux split-window -h -p 10 -t "$top_left"

  # Split top-left vertically to create bottom-left (10% height)
  tmux select-pane -t "$top_left"
  tmux split-window -v -p 10 -t "$top_left"

  # Focus top-left pane
  tmux select-pane -t "$top_left"

  log "Session '$SESSION' created."
}

# Attach to session
attach_session() {
  log "Attaching to tmux session '$SESSION'..."
  tmux attach-session -t "$SESSION"
}

# Entrypoint
main() {
  log "Checking tmux..."
  check_tmux

  create_session
  attach_session
}

main "$@"
