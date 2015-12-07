## Antigen setup & plugins
## =======================
source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pass
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply


## Aliases
## =======
# Aliases for opening apps with the terminal
alias chrome="open -a Google\ Chrome"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias photoshop="open -a Adobe\ Photoshop\ CC\ 2015"
alias illustrator="open -a Adobe\ Illustrator\ CC\ 2015"

# Mosh into VPS and reattach irc session
alias irc='mosh tor@rottum.me -- tmux attach -t irc'

alias v='vagrant'

# Exports
# =======
# Homebrew cask symlink path
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Vim as editor
export EDITOR=vim

# Include ~/.bin in PATH
export PATH="$HOME/.bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Add pear binaries to PATH
export PATH="$(brew --prefix php56)/bin:$PATH"

# Set the language variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Misc
# ====
# Source Z
. `brew --prefix`/etc/profile.d/z.sh

# Start gpg-agent
# ================
local GPG_ENV=$HOME/.gnupg/gpg-agent.env

if ! gpg-connect-agent --quiet /bye > /dev/null 2> /dev/null; then
    # source settings of old agent, if applicable
    if [ -f "${GPG_ENV}" ]; then
        . ${GPG_ENV} > /dev/null
        export GPG_AGENT_INFO
    fi

    # check again if another agent is running using the newly sourced settings
    if ! gpg-connect-agent --quiet /bye > /dev/null 2> /dev/null; then
    	eval $(/usr/bin/env gpg-agent --quiet --daemon --write-env-file ${GPG_ENV} 2> /dev/null)
    	chmod 600 ${GPG_ENV}
    	export GPG_AGENT_INFO
    fi
fi

GPG_TTY=$(tty)
export GPG_TTY
