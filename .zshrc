# Instant prompt for Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment
export EDITOR="nvim"
export BAT_THEME="vague"

# Add Go bin to PATH so goimports works
export PATH="$PATH:$HOME/go/bin"

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Aliases
alias ls='eza --long --all --git --icons --time-style=iso --group --classify'
alias tree="eza --all --tree --icons"

alias brew-maint="$HOME/dotfiles-macos/scripts/brew-maintenance.sh"
alias cleanup="$HOME/dotfiles-macos/scripts/system-cleanup.sh"
alias tmux-s="$HOME/dotfiles-macos/scripts/tmux-setup.sh"

# Zoxide (cd integration)
eval "$(zoxide init --cmd=cd zsh)"

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
