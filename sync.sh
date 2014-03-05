#!/bin/bash

# Some nice colors!
RED='\033[00;31m'
GREEN='\033[00;32m'
CYAN='\033[00;36m'
RESET='\033[0m'

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
		git clone https://github.com/zenorocha/dracula-theme.git dracula-theme
	else
		echo "Dracula-theme is already cloned. Pulling instead of cloning ..."
		pushd dracula-theme > /dev/null
		git pull
		popd > /dev/null
	fi

	echo ""

	# I will maybe automate this in the future, but for now, let's just write up each file/folder :)
	echo -e "${CYAN}Symlinking dotfiles into $HOME ...${RESET}"
	ln -s $(pwd)/.zshrc $HOME/.zshrc
	ln -s $(pwd)/.zsh/ $HOME/.zsh
	ln -s $(pwd)/.brewfile $HOME/.brewfile
	ln -s $(pwd)/.caskfile $HOME/.caskfile

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
	ln -s $(pwd)/dracula-theme/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
	# Check if Dracula is already imported, because iTerm will import it multiple times
	if ! grep -q Dracula $HOME/Library/Preferences/com.googlecode.iterm2.plist; then
		echo "Importing dracula-theme to iTerm ..."
		open dracula-theme/iterm/Dracula.itermcolors -a iTerm
	else
		echo -e "${GREEN}Dracula theme is already imported into iTerm :)${RESET}"
	fi

	echo -e "${GREEN}All done!${RESET}"
}

echo -e "${CYAN}Dotfiles!${RESET}"
echo -e "${RED}Warning:${RESET} This might ${RED}**OVERWRITE**${RESET} files in your home directoy!"
echo -e "Also please note that you should ${RED}never${RESET} run this script outside of the git repo folder\nbad things will probably happen if you do so"
echo ""
# TODO: ask
read -p "Are you sure you want to do this? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sync
fi

unset sync
