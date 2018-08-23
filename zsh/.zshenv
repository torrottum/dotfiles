export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vim"
export PATH="/usr/local/bin:$HOME/.bin:$HOME/.composer/vendor/bin:$PATH"
export GOPATH="$HOME/code/go"

if [ -f "$HOME/.zshenv.private" ]; then
    source "$HOME/.zshenv.private"
fi
