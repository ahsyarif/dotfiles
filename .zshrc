# ~/.zshrc



# History file for zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000



eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)


#Source

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


#Aliases

alias la="eza -l -a --icons --no-user"
alias ls="eza -l --icons --no-user"
alias v="nvim"
alias x="exit"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."


export PATH="$PATH:/usr/local/bin/docker"


eval "$(~/.local/bin/mise activate)"
alias config='/usr/bin/git --git-dir=/Users/ahsyarif/dotfiles/ --work-tree=/Users/ahsyarif'
