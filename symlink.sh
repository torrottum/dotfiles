#!/bin/bash

export DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if hash stow 2> /dev/null; then
	echo "==> Symlinking files using stow"
	for DIR in $DOTFILES_PATH/*; do
		if [[ -d "$DIR" && $(basename "$DIR") != "init" ]]; then
			echo "==> Stowing $(basename "$DIR") ..."
			stow "$(basename "$DIR")" -d $DOTFILES_PATH -t $HOME --no-folding
		fi
	done
else
	echo "stow is not installed. Exiting ..."
fi
