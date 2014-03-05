# Stolen from https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile
for file in ~/.zsh/.{oh-my-zsh,exports,aliases,functions,private}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
