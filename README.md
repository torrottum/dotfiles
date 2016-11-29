# Dotfiles
My dotfiles for my OS X computers (Early 2015 rMPB and hackintosh)

## Installation
1. Install [homebrew](http://brew.sh/), [zplug](https://github.com/zplug/zplug), and XCode
1. Clone the repo

	```sh
	git clone https://github.com/torrottum/dotfiles
	cd dotfiles
	```
1. Install applications with homebrew and homebrew cask

	```sh
	./.brew
	./.cask
	```
1. Change macOS settings `./.macos`
1. Symlink and stuff
	```sh
	# ZSH
	ln -sf $(pwd)/.zshrc ~/.zshrc
	ln -sf $(pwd)/.zshenv ~/.zshenv
	ln -sf $(pwd)/zsh ~/.zsh

	# Set zsh as shell
	echo $(which zsh) | sudo tee -a /etc/shells
	chsh -s $(which zsh)

	# Git
	ln -sf $(pwd)/.gitconfig ~/.gitconfig
	ln -sf $(pwd)/.gitignore_global ~/.gitignore_global

	# Homebrew
	ln -sf $(pwd)/.cask ~/.cask
	ln -sf $(pwd)/.brew ~/.brew

	# .macos
	ln -sf $(pwd)/.macos ~/.macos

	# .gemrc
	ln -sf $(pwd)/.gemrc ~/.gemrc

	# Sublime
	# Delete sublime User directory
	rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
	# Make sure the Packages folder exists
	mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
	ln -sf $(pwd)/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/

	# vim
	ln -sf $(pwd)/vim/.vimrc ~/.vimrc

	# Mpv
	mkdir -p ~/.config/mpv
	ln -sf $(pwd)/mpv/mpv.conf ~/.config/mpv/mpv.conf
	ln -sf $(pwd)/mpv/input.conf ~/.config/mpv/input.conf

	# GnuPG
	mkdir -p ~/.gnupg
	ln -sf $(pwd)/gpg/gpg.conf ~/.gnupg/gpg.conf
	ln -sf $(pwd)/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

	## Composer
	mkdir -p ~/.composer
	ln -sf $(pwd)/composer/composer.json ~/.composer/composer.json
	ln -sf $(pwd)/composer/composer.json ~/.composer/composer.lock
	composer global install
	```

## Credits
* [Mathias Bynens](https://github.com/mathiasbynens) and his [dotfiles](https://github.com/mathiasbynens/dotfiles) for .macos (mine is customized)
