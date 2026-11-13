# Set Homebrew environment statically because shellenv forks a subprocess
export HOMEBREW_PREFIX="/opt/homebrew"

# Load instant prompt
P10K_INSTANT_PROMPT="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$P10K_INSTANT_PROMPT" ]] && source "$P10K_INSTANT_PROMPT"

# Set environment defaults
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export BAT_THEME="ansi"

# Persist shell history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Keep each PATH entry unique
typeset -U path PATH

# Extend PATH
export PNPM_HOME="$HOME/Library/pnpm"
path=(
  "$PNPM_HOME/bin"
  "$HOMEBREW_PREFIX/bin"
  "$HOMEBREW_PREFIX/sbin"
  $path
  "$HOME/.local/share/nvim/mason/bin"
)

# Set terminal window title
function precmd() {
  print -Pn '\e]0;I use "VIM" btw ;-)\a'
}

# Initialize completion system with the cached dump because -C skips the scan
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR"

fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)

autoload -Uz compinit
compinit -C -d "$ZSH_CACHE_DIR/zcompdump"

# Load plugins if installed
(( $+commands[zoxide] )) && eval "$(zoxide init zsh --cmd cd)"

[[ -f "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme" ]] &&
  source "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -f ~/.p10k.zsh ]] &&
  source ~/.p10k.zsh

# Register aliases
alias vim="nvim"
alias tmux-s="$HOME/dotfiles-macos/scripts/tmux-sessionaire.sh"

if (( $+commands[eza] )); then
  alias ll='eza --long --all --git --icons --time-style=iso --group --classify=auto'
  alias tree='eza --all --tree --icons --ignore-glob="node_modules|.git|.jj|target"'
fi
