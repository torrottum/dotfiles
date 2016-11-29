if ! hash antibody 2> /dev/null; then
    echo 'Install antibody: https://github.com/getantibody/antibody'
    return
fi

source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle < ~/.zsh/zplugins

# Stuff from oh-my-zsh
source ~/.zsh/oh-my-zsh/lib/key-bindings.zsh
source ~/.zsh/oh-my-zsh/lib/history.zsh
source ~/.zsh/oh-my-zsh/lib/completion.zsh
source ~/.zsh/oh-my-zsh/lib/directories.zsh

setopt autocd
setopt interactivecomments
bindkey -e

autoload -U compinit
compinit

alias irc="mosh tor@torrottum.no -- tmux attach -t irc"
alias ls="ls -G"
alias subl="echo use vim you fool!"

# auto push password-store
function pass {
    args_to_intercept=(insert edit generate rm mv cp)
    if [[ " ${args_to_intercept[@]} " =~ " ${1} " ]]; then
        command pass "$@"
        command pass git push
    else
        command pass "$@"
    fi
}
