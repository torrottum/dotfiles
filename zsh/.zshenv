export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH="/usr/local/bin:$HOME/.bin:$PATH"
export EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if hash gpg-agent 2>/dev/null; then
    if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
        source ~/.gnupg/.gpg-agent-info
        export GPG_AGENT_INFO
    else
        eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
    fi
fi
