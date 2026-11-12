# Neovim keymaps

Leader is `Space`. Source paths are relative to `.config/nvim/lua/`.

Modes: Normal, Insert, Visual (`x`), Visual/Select (`v`), Operator-pending (`o`).

## General

Source: `config/keymaps.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Insert | `jk` | Exit insert mode |
| Normal | `<leader>+` | Increment number |
| Normal | `<leader>-` | Decrement number |
| Normal | `<leader>cs` | Clear search highlights |
| Normal | `<leader>us` | Save and source file |
| Normal | `<leader>xq` | Diagnostics to quickfix list |
| Normal | `<leader>xl` | Diagnostics to location list |
| Normal | `<leader>xt` | Toggle diagnostic virtual text |

## Git (gitsigns)

Source: `plugins/gitsigns.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `]c` | Next git hunk |
| Normal | `[c` | Previous git hunk |
| Normal | `<leader>hs` | Stage hunk |
| Normal | `<leader>hr` | Reset hunk |
| Visual/Select | `<leader>hs` | Stage selected lines |
| Visual/Select | `<leader>hr` | Reset selected lines |
| Normal | `<leader>hS` | Stage buffer |
| Normal | `<leader>hR` | Reset buffer |
| Normal | `<leader>hp` | Preview hunk |
| Normal | `<leader>hb` | Blame line |
| Normal | `<leader>hd` | Diff against index |
| Normal | `<leader>tb` | Toggle line blame |
| Operator-pending, Visual | `ih` | Select hunk |

## Testing (neotest)

Source: `plugins/neotest.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `<leader>tt` | Toggle test summary |
| Normal | `<leader>tr` | Run nearest test |
| Normal | `<leader>ts` | Stop test run |
| Normal | `<leader>ta` | Attach to test run |
| Normal | `<leader>to` | Open test output |
| Normal | `<leader>tf` | Run tests in file |
| Normal | `<leader>td` | Debug nearest test |

## Debugging (nvim-dap)

Source: `plugins/nvim-dap.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `<leader>db` | Toggle breakpoint |
| Normal | `<leader>dc` | Continue debugging |
| Normal | `<leader>di` | Step into |
| Normal | `<leader>do` | Step over |
| Normal | `<leader>dO` | Step out |
| Normal | `<leader>dt` | Terminate debug session |
| Normal | `<leader>dr` | Open debug REPL |
| Normal | `<leader>du` | Toggle debug UI |

## Treesitter selection

Source: `plugins/nvim-treesitter.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `<leader>ci` | Start selection |
| Visual | `<leader>ci` | Grow selection |
| Visual | `<leader>cd` | Shrink selection |

## Treesitter textobjects

Source: `plugins/nvim-treesitter-textobjects.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Visual, Operator-pending | `af` | Select outer function |
| Visual, Operator-pending | `if` | Select inner function |
| Visual, Operator-pending | `aa` | Select outer parameter |
| Visual, Operator-pending | `ia` | Select inner parameter |
| Normal, Visual, Operator-pending | `]f` | Next function start |
| Normal, Visual, Operator-pending | `]a` | Next parameter start |
| Normal, Visual, Operator-pending | `]F` | Next function end |
| Normal, Visual, Operator-pending | `]A` | Next parameter end |
| Normal, Visual, Operator-pending | `[f` | Previous function start |
| Normal, Visual, Operator-pending | `[a` | Previous parameter start |
| Normal, Visual, Operator-pending | `[F` | Previous function end |
| Normal, Visual, Operator-pending | `[A` | Previous parameter end |

## Refactoring

Source: `plugins/refactoring.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Normal, Visual | `<leader>rs` | Select refactor |

## Telescope

Source: `plugins/telescope.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `<leader>ff` | Find files |
| Normal | `<leader>fg` | Live grep |
| Normal | `<leader>fb` | Find buffers |
| Normal | `<leader>fh` | Find help tags |

## Database (vim-dadbod)

Source: `plugins/vim-dadbod.lua`

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `<leader>Db` | Toggle database UI |
| Normal | `<leader>Dl` | Toggle query result layout |

## HTTP client (kulala)

Source: `plugins/kulala.lua`

Plugin defaults from `global_keymaps = true` with the `<leader>R` prefix. Keys marked *http, rest* only work in those filetypes.

| Mode | Key | Description | Filetype |
| --- | --- | --- | --- |
| Normal | `<leader>Rb` | Open scratchpad | all |
| Normal | `<leader>Ro` | Open kulala | all |
| Normal | `<leader>Rq` | Close window | http, rest |
| Normal | `<leader>Rc` | Copy as cURL | http, rest |
| Normal | `<leader>RC` | Paste from curl | http, rest |
| Normal | `<leader>Ri` | Inspect current request | http, rest |
| Normal | `<leader>Rj` | Open cookies jar | http, rest |
| Normal | `<leader>Re` | Select environment | http, rest |
| Normal | `<leader>Ru` | Manage Auth Config | http, rest |
| Normal, Visual/Select | `<leader>Rs` | Send request | all |
| Normal, Visual/Select | `<CR>` | Send request \<cr> | http, rest |
| Normal, Visual/Select | `<leader>Ra` | Send all requests | all |
| Normal | `<leader>Rr` | Replay the last request | all |
| Normal | `<leader>Rg` | Download GraphQL schema | http, rest |
| Normal | `<leader>Rn` | Jump to next request | http, rest |
| Normal | `<leader>Rp` | Jump to previous request | http, rest |
| Normal | `<leader>Rf` | Find request | http, rest |
| Normal | `<leader>RH` | Search responses | http, rest |
| Normal | `<leader>Rt` | Toggle headers/body | http, rest |
| Normal | `<leader>RS` | Show stats | http, rest |
| Normal | `<leader>Rx` | Clear globals | http, rest |
| Normal | `<leader>RX` | Clear cached files | http, rest |

## Surround (nvim-surround)

Source: `plugins/nvim-surround.lua`

Plugin defaults, not set in this config.

| Mode | Key | Description |
| --- | --- | --- |
| Insert | `<C-g>s` | Add a surrounding pair around the cursor (insert mode) |
| Insert | `<C-g>S` | Add a surrounding pair around the cursor, on new lines (insert mode) |
| Normal | `ys` | Add a surrounding pair around a motion (normal mode) |
| Normal | `yss` | Add a surrounding pair around the current line (normal mode) |
| Normal | `yS` | Add a surrounding pair around a motion, on new lines (normal mode) |
| Normal | `ySS` | Add a surrounding pair around the current line, on new lines (normal mode) |
| Normal | `ds` | Delete a surrounding pair |
| Normal | `cs` | Change a surrounding pair |
| Normal | `cS` | Change a surrounding pair, putting replacements on new lines |
| Visual | `S` | Add a surrounding pair around a visual selection |
| Visual | `gS` | Add a surrounding pair around a visual selection, on new lines |

## Completion (nvim-cmp)

Source: `plugins/nvim-cmp.lua`

The `<C-b>`, `<C-f>`, `<Tab>` and `<S-Tab>` keys are set in this config. The rest come from `cmp.mapping.preset.insert`.

| Mode | Key | Description |
| --- | --- | --- |
| Insert | `<C-b>` | Scroll docs up |
| Insert | `<C-f>` | Scroll docs down |
| Insert, Select | `<Tab>` | Next completion item, otherwise expand or jump snippet |
| Insert, Select | `<S-Tab>` | Previous completion item, otherwise jump back in snippet |
| Insert | `<C-n>` | Next completion item, or open completion |
| Insert | `<C-p>` | Previous completion item, or open completion |
| Insert | `<Down>` | Next completion item |
| Insert | `<Up>` | Previous completion item |
| Insert | `<C-y>` | Confirm selected item |
| Insert | `<C-e>` | Close completion menu |

## Auto pairs (mini.pairs)

Source: `plugins/mini-pairs.lua`

Plugin defaults, with command-line mode enabled in this config.

| Mode | Key | Description |
| --- | --- | --- |
| Insert, Command | `(` `[` `{` | Insert the matching closing bracket |
| Insert, Command | `)` `]` `}` | Jump over the closing bracket |
| Insert, Command | `"` `'` `` ` `` | Insert or jump over the matching quote |
| Insert, Command | `<BS>` | Delete both characters of an empty pair |
| Insert | `<CR>` | Split an empty pair onto separate lines |

## Tmux navigation (vim-tmux-navigator)

Source: `plugins/vim-tmux-navigator.lua`

Plugin defaults, not set in this config.

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `<C-h>` | Move to the left split or tmux pane |
| Normal | `<C-j>` | Move to the split or tmux pane below |
| Normal | `<C-k>` | Move to the split or tmux pane above |
| Normal | `<C-l>` | Move to the right split or tmux pane |
| Normal | `<C-\>` | Move to the previous split or tmux pane |

## Neovim defaults

Built into Neovim, not set in this config. Listed because they sit next to the keys above.

| Mode | Key | Description |
| --- | --- | --- |
| Normal | `grn` | Rename symbol |
| Normal, Visual | `gra` | Code action |
| Normal | `grr` | Show references |
| Normal | `gri` | Go to implementation |
| Normal | `grt` | Go to type definition |
| Normal | `grx` | Run code lens |
| Normal | `gO` | Document symbols |
| Insert, Select | `<C-S>` | Signature help |
| Normal | `[d` `]d` | Previous or next diagnostic |
| Normal | `<C-W>d` | Show diagnostics under the cursor |
| Normal, Visual | `gc` | Toggle comment |
| Normal | `gcc` | Toggle comment line |
| Visual | `an` `in` | Grow or shrink the selection by tree-sitter node |
| Visual | `[n` `]n` | Select previous or next node |

