#!/usr/bin/env bash

set -euo pipefail

pane_path="$(tmux display-message -p '#{pane_current_path}')"
path_hash="$(printf '%s' "$pane_path" | md5 -q | cut -c1-8)"
session="pi-$path_hash"

if ! tmux has-session -t "$session" 2>/dev/null; then
  tmux new-session -d -s "$session" -c "$pane_path" pi
fi

tmux display-popup -w 80% -h 80% -E "tmux attach-session -t $session"
