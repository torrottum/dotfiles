if [ ! -f ~/.zplug/init.zsh ]; then
    echo "Install zplug: https://github.com/zplug/zplug"
    return
fi

source ~/.zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "rupa/z", use:"*.sh"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "lib/history", from:oh-my-zsh, ignore:oh-my-zsh.sh, nice:10
zplug "lib/completion", from:oh-my-zsh, ignore:oh-my-zsh.sh, nice:10
zplug "lib/directories", from:oh-my-zsh, ignore:oh-my-zsh.sh, nice:10

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

alias irc="mosh tor@torrottum.no -- tmux attach -t irc"
alias ls="ls -G"

setopt autocd
setopt interactivecomments
bindkey -e
