#!/bin/bash

if hash brew 2> /dev/null; then
	echo "==> Homebrew is already installed";
	exit;
fi

echo "==> Installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

if hash brew 2> /dev/null; then
	echo "==> Success: homebrew installed"
else
	echo "==> Error: could not install homebrew"
fi

