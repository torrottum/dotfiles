if [ ! -f ~/.zplug/zplug ]; then
    echo "Install zplug: https://github.com/b4b4r07/zplug"
    return
fi

source ~/.zplug/zplug

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zplug/zplug"
zplug "rupa/z", use:"*.sh"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "lib/history", from:oh-my-zsh, ignore:oh-my-zsh.sh, nice:10
zplug "lib/completion", from:oh-my-zsh, ignore:oh-my-zsh.sh, nice:10
zplug "lib/directories", from:oh-my-zsh, ignore:oh-my-zsh.sh, nice:10
zplug load

alias chrome="open -a Google\ Chrome"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias irc="mosh tor@rottum.me -- tmux attach -t irc"
alias v="vagrant"
alias ls="ls -G"

autoload -U colors && colors
setopt autocd
bindkey -e

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
