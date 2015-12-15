#!/usr/bin/env bash

export DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DOTFILES_PATH;

function create_symlink {
	DIRNAME=$(dirname "$1")

	# Create folders
	if [[ $DIRNAME != "." ]]; then
		if [ ! -d "$HOME/$DIRNAME" ]; then
			mkdir -p "$HOME/$DIRNAME"
		fi
	fi

	ln -sFnv "$DOTFILES_PATH/$1" "$HOME/$1"
}

function create_symlinks {
	OLDIFS=$IFS; IFS=''

	FILES=(
		"Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
		"Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
		"Library/Application Support/Sublime Text 3/Packages/User/SCSS.sublime-settings"
		.config/mpv/input.conf
		.config/mpv/mpv.conf
		.gnupg/gpg.conf
		.gnupg/gpg-agent.conf
		.maid/rules.rb
		.bin/sync-pass
		.brew
		.cask
		.crontab
		.gems
		.gemrc
		.gitconfig
		.gitignore
		.node
		.osx
		.zshrc
		.zlogin
		.bash_profile
	)

	for FILE in ${FILES[@]}; do
		create_symlink "$FILE"
	done

	IFS=$OLDIFS
}

function run_init_scripts {
	# Ask for the administrator password upfront
	sudo -v

	# Keep-alive: update existing `sudo` time stamp until `bootstrap.sh` has finished
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

	for SCRIPT in $DOTFILES_PATH/init/*.sh; do
		bash "$SCRIPT"
	done
}

function ask {
	read -p "$1 " -n 1;
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo ""
		return 0
	fi

	return 1
}

if ask "This will replace existing files/folders in your home directory. Are you sure? (y/n)"; then
	create_symlinks;
fi

echo ""

if ask "Do you want to run the init scripts? (y/n)"; then
	run_init_scripts;
fi
