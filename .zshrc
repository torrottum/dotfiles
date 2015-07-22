## Antigen setup & plugins
## =======================
source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
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

# Set the language variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Misc
# ====
# Source Z
. `brew --prefix`/etc/profile.d/z.sh


