for file in ~/.{aliases,exports}; do
	[[ -r "$file" ]] && . "$file"
done;

[[ -r "$ZSH/oh-my-zsh.sh" ]] && . "$ZSH/oh-my-zsh.sh"
