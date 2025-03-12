# ~/.zshrc



# History file for zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


eval "$(~/.local/bin/mise activate)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


#Source

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)


#Aliases

alias la="eza -l -a --icons --no-user"
alias ls="eza -l --icons --no-user"
alias v="nvim"
alias x="exit"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias config='/usr/bin/git --git-dir=/Users/ahsyarif/dotfiles/ --work-tree=/Users/ahsyarif'




#export

export PATH="$PATH:/usr/local/bin/docker"




#Yazi config

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
