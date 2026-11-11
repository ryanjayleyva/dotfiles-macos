#!/usr/bin/env bash

set -euo pipefail

SESSION_NAME="${SESSION_NAME:-dev}"
WINDOW_NAME="${WINDOW_NAME:-main}"

command -v tmux &>/dev/null || {
  printf '%s\n' 'Not found: tmux' >&2
  exit 1
}

if ! tmux has-session -t "=$SESSION_NAME" 2>/dev/null; then
  main_pane_id="$(tmux new-session -d -s "$SESSION_NAME" -n "$WINDOW_NAME" -P -F '#{pane_id}')"
  tmux split-window -h -l 10% -t "$main_pane_id"
  tmux split-window -v -l 10% -t "$main_pane_id"
  tmux select-pane -t "$main_pane_id"
fi

if [[ -n "${TMUX:-}" ]]; then
  tmux switch-client -t "=$SESSION_NAME"
else
  exec tmux attach-session -t "=$SESSION_NAME"
fi
