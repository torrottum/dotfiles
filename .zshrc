if [ ! -f ~/.zplug/zplug ]; then
	echo "Install zplug: https://github.com/b4b4r07/zplug"
	return
fi

source ~/.zplug/zplug


#############
#  Plugins  #
#############

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "b4b4r07/zplug"
zplug "rupa/z", of:"*.sh"


#############
#  Aliases  #
#############

# Aliases for opening in applications
alias chrome="open -a Google\ Chrome"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias photoshop="open -a Adobe\ Photoshop\ CC\ 2015"
alias illustrator="open -a Adobe\ Illustrator\ CC\ 2015"

# Mosh into VPS and reattach irc session
alias irc='mosh tor@rottum.me -- tmux attach -t irc'

# Attach or create tmux session with lftp connected to seedbox
alias seedbox="tmux attach -t seedbox 2> /dev/null || tmux new -s seedbox \"cd ~/Downloads; lftp -e 'cd data' sftp://torprivacy:@pontus.feralhosting.com\""

alias v='vagrant'


#############
#  Exports  #
#############

# Homebrew cask symlink path
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Vim as editor
export EDITOR=vim

# Include ~/.bin in PATH
export PATH="$HOME/.bin:$PATH"

# Language
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"


##########
#  Misc  #
##########

# Start ssh-agent & gpg-agent using keychain
if [[ ! -f "$HOME/.keychain/$HOST-sh" || ! -f "$HOME/.keychain/$HOST-sh-gpg" ]]; then
	eval `keychain --eval id_rsa --inherit any --agents ssh,gpg --quiet`
else
	. "$HOME/.keychain/$HOST-sh"
	. "$HOME/.keychain/$HOST-sh-gpg"
fi


#################
#  Zplug stuff  #
#################

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins and add commands to $PATH
zplug load
