#!/bin/bash

export DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DOTFILES_PATH;

function ask {
	read -p "$1 " -n 1;
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo ""
		return 0
	fi

	return 1
}

if ask 'Run the scripts inside the init folder? (Y/n)'; then
	for SCRIPT in $DOTFILES_PATH/init/*.sh; do
		echo "==> Running $SCRIPT";
		bash "$SCRIPT";
	done
else
	exit
fi

echo
echo "All done!"
echo "Now symlink the parts you want using 'stow FOLDER -t \$HOME --no-folding' or use the 'symlink.sh' script"
