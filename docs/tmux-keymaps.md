# tmux keymaps

Prefix is `Ctrl-a`. Source paths are relative to `.config/tmux/`.

Copy mode uses vi keys (`mode-keys vi` in `options.conf`).

## Prefix

Source: `bindings.conf`

| Key | Description |
| --- | --- |
| `Ctrl-a` | Prefix (replaces the default `Ctrl-b`) |
| `Ctrl-a Ctrl-a` | Send a literal `Ctrl-a` to the running app |

## Splits

Source: `bindings.conf`

| Key | Description |
| --- | --- |
| `Ctrl-a \|` | Split window horizontally (side by side) |
| `Ctrl-a -` | Split window vertically (stacked) |

The default `%` and `"` split bindings are unbound.

## Config

Source: `bindings.conf`

| Key | Description |
| --- | --- |
| `Ctrl-a r` | Reload `tmux.conf` |

## Resize and zoom

Source: `bindings.conf`

| Key | Description |
| --- | --- |
| `Ctrl-a h` | Resize pane left by 5 |
| `Ctrl-a j` | Resize pane down by 5 |
| `Ctrl-a k` | Resize pane up by 5 |
| `Ctrl-a l` | Resize pane right by 5 |
| `Ctrl-a m` | Toggle pane zoom |

## Pane navigation

Source: `bindings.conf`

Works with `vim-tmux-navigator`. When the active pane is running Neovim, vim,
or fzf, the no-prefix keys are passed through to it instead of switching
panes.

| Key | Description |
| --- | --- |
| `Ctrl-h` | Select pane left (no prefix) |
| `Ctrl-j` | Select pane below (no prefix) |
| `Ctrl-k` | Select pane above (no prefix) |
| `Ctrl-l` | Select pane right (no prefix) |
| `Ctrl-\` | Select last pane (no prefix) |
| `Ctrl-a Ctrl-h` | Select pane left |
| `Ctrl-a Ctrl-j` | Select pane below |
| `Ctrl-a Ctrl-k` | Select pane above |
| `Ctrl-a Ctrl-l` | Select pane right |
| `Ctrl-a Ctrl-\` | Select last pane |

### Copy mode (vi)

| Key | Description |
| --- | --- |
| `Ctrl-h` | Select pane left |
| `Ctrl-j` | Select pane below |
| `Ctrl-k` | Select pane above |
| `Ctrl-l` | Select pane right |
| `Ctrl-\` | Select last pane |

## Agent Launchers

Source: `bindings.conf`

| Key | Description |
| --- | --- |
| `Ctrl-a y` | Run `scripts/pi-launcher.sh` |
