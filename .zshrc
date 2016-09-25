if ! hash antibody 2> /dev/null; then
    echo 'Install antibody: https://github.com/getantibody/antibody'
    return
fi

source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle < ~/.zsh/.zplugins

source ~/.zsh/key-bindings.zsh
source ~/.zsh/history.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/directories.zsh

alias irc="mosh tor@torrottum.no -- tmux attach -t irc"
alias ls="ls -G"

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

setopt autocd
setopt interactivecomments
bindkey -e
