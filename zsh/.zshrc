if ! hash antibody 2> /dev/null; then
    if hash brew 2> /dev/null; then
        echo "Installing antibody ..."
        brew install antibody
    else
        echo 'Install antibody: https://github.com/getantibody/antibody'
        return
    fi
fi

if [ ! -d "$HOME/.ohmyzsh/" ]; then
    echo "Cloning oh my zsh"
    git clone https://github.com/robbyrussell/oh-my-zsh ~/.ohmyzsh --depth 1
fi

source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle rupa/z
antibody bundle zsh-users/zsh-syntax-highlighting

source ~/.ohmyzsh/lib/key-bindings.zsh
source ~/.ohmyzsh/lib/history.zsh
source ~/.ohmyzsh/lib/completion.zsh
source ~/.ohmyzsh/lib/directories.zsh

setopt autocd
setopt interactivecomments
bindkey -e

autoload -U compinit
compinit

alias ls="ls -G"
