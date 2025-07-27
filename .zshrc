# ~/.zshrc



# History file for zsh
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


#AutoCompletions

bindkey '\t' autosuggest-accept

fpath+=~/.zfunc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit -u
zstyle ':completion:*' menu select



#Vim mode
bindkey -v
export KEYTIMEOUT=1

eval "$(zoxide init zsh)"
eval $(thefuck --alias FUCK)

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

#Source

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)


#Aliases

alias la="eza -l -a --icons --no-user --no-symlinks"
alias ls="eza -l --icons --no-user --no-symlinks"
alias v="nvim"
alias x="exit"
alias c="clear"
alias e="yazi"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias config='/usr/bin/git --git-dir=/Users/ahsyarif/.dotfiles/ --work-tree=/Users/ahsyarif'




#export

export PATH="$PATH:/usr/local/bin/docker"
export EDITOR="nvim"

#Yazi config

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

