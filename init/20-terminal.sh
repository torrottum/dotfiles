#!/bin/bash

echo "==> Importing Terminal profile"
open $DOTFILES_PATH/init/misc/terminal.terminal
sleep 1
defaults write com.apple.Terminal "Default Window Settings" -string "terminal"
defaults write com.apple.Terminal "Startup Window Settings" -string "terminal"

