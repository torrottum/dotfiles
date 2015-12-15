#!/bin/bash

if hash brew 2> /dev/null; then
	echo "==> Running .brew"
	$DOTFILES_PATH/.brew

	echo "==> Running .cask"
	$DOTFILES_PATH/.cask
fi

if hash npm 2> /dev/null; then
	echo "==> Running .node"
	$DOTFILES_PATH/.node
fi


if hash rvm 2> /dev/null; then
	echo "==> Running .gems"
	$DOTFILES_PATH/.gems
fi
