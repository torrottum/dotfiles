## Antigen setup & plugins
## =======================
source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure theme
antigen bundle sindresorhus/pure

antigen apply


## Aliases
## =======
# Aliases for opening apps with the terminal
alias chrome="open -a Google\ Chrome"
alias firefox="open -a Firefox"

# Turn Airdrop on or off (see http://lifehacker.com/fix-yosemite-wi-fi-issues-with-a-terminal-command-1663414063)
alias airdropon='sudo ifconfig awdl0 up'
alias airdropoff='sudo ifconfig awdl0 down'

# Mosh into VPS and reattach irc session
alias irc='mosh tor@rottum.me -- tmux attach -t irc'

# Exports
# =======
# Homebrew cask symlink path
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Include ~/.bin in PATH
export PATH="$HOME/.bin:$PATH"

# Set the language variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"


# Misc
# ====
# Source Z
. `brew --prefix`/etc/profile.d/z.sh


# Functions
# =========

# rsync to and from Dropbox folder
function syncToDropbox {
	if [[ $1 == "--delete" ]]; then
		rsync -aE --delete $HOME/Documents/ $HOME/Dropbox/Documents/
	else
		rsync -aE $HOME/Documents/ $HOME/Dropbox/Documents/
	fi
}

function syncFromDropbox {
	if [[ $1 == "--delete" ]]; then
		rsync -aE --delete $HOME/Dropbox/Documents/ $HOME/Documents/
	else
		rsync -aE $HOME/Dropbox/Documents/ $HOME/Documents/
	fi
}
