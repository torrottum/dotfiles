#!/bin/bash

# Some nice colors!
RED='\033[00;31m'
GREEN='\033[00;32m'
CYAN='\033[00;36m'
RESET='\033[0m'

# Get the dotfiles absoulute path, where it is called from shouldn't matter
DIR="$( cd "$( dirname "$0" )" && pwd )"

function sync(){
	# Some spacing plz!
	echo ""

	git pull

	echo ""

	echo -e "${CYAN}Checking if Oh My ZSH is installed ...${RESET}"
	if [[ ! -d ~/.oh-my-zsh ]]; then
		echo -e "${RED}Oh My ZSH is not installed :(${RESET}"
		echo "Installing Oh My ZSH ..."
		git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
		chsh -s /bin/zsh
	else
		echo -e "${GREEN}Oh My ZSH already installed, skipping installation :)${RESET}"
	fi

	echo ""

	echo -e "${CYAN}Checking if homebrew is installed ...${RESET}"
	if [[ -z $(command -v brew) ]]; then
		echo -e "${RED}Homebrew is not installed :(${RESET}"
		echo "Installing homebrew ..."
		ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	else
		echo -e "${GREEN}Homebrew already installed, skipping installation :)${RESET}"
	fi

	echo ""

	echo -e "${CYAN}Checking if dracula-theme is cloned ...${RESET}"
	if [[ ! -d dracula-theme ]]; then
		echo "Dracula-theme is not cloned, cloning ..."
		git clone https://github.com/zenorocha/dracula-theme.git $DIR/dracula-theme
	else
		echo "Dracula-theme is already cloned. Pulling instead of cloning ..."
		pushd $DIR/dracula-theme > /dev/null
		git pull
		popd > /dev/null
	fi

	echo ""

	# I will maybe automate this in the future, but for now, let's just write up each file/folder :)
	echo -e "${CYAN}Symlinking dotfiles into $HOME ...${RESET}"
	ln -s $DIR/.zshrc $HOME/.zshrc
	ln -s $DIR/.zsh/ $HOME/.zsh
	ln -s $DIR/.brewfile $HOME/.brewfile
	ln -s $DIR/.caskfile $HOME/.caskfile
	ln -s $DIR/.osx $HOME/.osx

	echo ""

	echo -e "${CYAN}Symlinking Sublime Text 3 settings ...${RESET}"
	if [[ ! -d $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/ ]]; then
		mkdir -p $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
	fi
	ln -s $DIR/sublime-text/Package\ Control.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
	ln -s $DIR/sublime-text/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

	echo ""

	echo -e "${CYAN}brew bundling from .brewfile ...${RESET}"
	brew bundle .brewfile

	echo ""

	echo -e "${CYAN}brew bundling from .caskfile ..${RESET}"
	export HOMEBREW_CASK_OPTS="--appdir=/Applications"
	brew bundle .caskfile

	echo ""

	echo -e "${CYAN}Setting up colorschemes ...${RESET}"
	echo "Symlinking dracula-theme for ZSH ..."
	ln -s $DIR/dracula-theme/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
	# Check if Dracula is already imported, because iTerm will import it multiple times
	if ! grep -q Dracula $HOME/Library/Preferences/com.googlecode.iterm2.plist; then
		echo "Importing dracula-theme to iTerm ..."
		open $DIR/dracula-theme/iterm/Dracula.itermcolors -a iTerm
	else
		echo -e "${GREEN}Dracula theme is already imported into iTerm :)${RESET}"
	fi

	echo -e "${CYAN}Running $HOME/.osx ...${RESET}"
	$HOME/.osx
	echo -e "${GREEN}All done!${RESET}"
}

echo -e "${CYAN}Dotfiles!${RESET}"
echo -e "${RED}Warning:${RESET} This might ${RED}**overwrite**${RESET} files in your home directory!"
echo -e "It will also install cli apps, gui apps and reconfigure stuff. Run at your own risk"
echo ""

read -p "Are you sure you want to do this? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sync
fi

unset sync
