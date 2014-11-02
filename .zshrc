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
