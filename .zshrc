[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

for file in ~/.{aliases,exports}; do
	[[ -r "$file" ]] && . "$file"
done;

# Modifies 0x15 to only delete characters to the left of the cursor
bindkey "^U" backward-kill-line

[[ -r "$ZSH/oh-my-zsh.sh" ]] && . "$ZSH/oh-my-zsh.sh"

[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
