#!/bin/bash

if ! hash rvm 2> /dev/null; then
	echo "==> Installing ruby"
	if hash gpg 2> /dev/null; then
		gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	fi
	\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles stable
else
	echo "==> Ruby already installed"
fi
