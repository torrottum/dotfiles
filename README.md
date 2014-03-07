# Dotfiles
My dotfiles for zsh, homebrew, homebrew-cask, OS X settings, etc.

The point of the repo is that when I reinstall OS X, or setup a new machine I can just clone the repo and run the `sync.sh` file

## Installation
*(At your own risk, of course!)*

Run `./sync.sh` which will first warn and ask you if you are sure. Then it will do a `git pull`, and then install things and symlink dotfiles. 

**If I were you I'd look inside the script to see what it's doing before running it.**

## Credits
Some of the things and ideas in this repo is taken from others:
* [Mathias Bynens](https://github.com/mathiasbynens) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles) for the excellent ~/.osx (I have customized mine, though)
