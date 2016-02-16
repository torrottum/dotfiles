#!/bin/bash

echo "==> Setting shell to zsh"
if sudo chsh -s '/bin/zsh' "${USER}"; then
	echo "==> Success: shell set to zsh"
else
	echo "==> Error: could not set shell to zsh"
fi

if [ ! -f ~/.zplug/zplug ]; then
	echo "==> Installing zplug"
 	curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
fi
