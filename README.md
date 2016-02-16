# Dotfiles
My dotfiles for my OS X computers (Early 2015 rMPB and hackintosh)

## Installation
Install the Xcode Command Line Tools installed `xcode-select --install`

Clone the repo and run `./init.sh`
```
$ git clone https://github.com/torrottum/dotfiles
$ cd dotfiles
$ ./init.sh
```

Optionally run `./symlink.sh` to automagically symlink the files using GNU Stow or symlink the parts manually using `stow FOLDER -t $HOME --no-folding`

## Credits
* [Mathias Bynens](https://github.com/mathiasbynens) and his [dotfiles](https://github.com/mathiasbynens/dotfiles) for .osx (mine is customized)
