# Dotfiles
My dotfiles for my OS X computers (Early 2015 rMPB and hackintosh)

**Note: these should probably not be cloned and used by someone other than me. My dotfiles are customized to my personal needs and might do things you didn't intend to do. But feel free to use parts of them as you wish.**

## Features
* zsh with [zplug](https://github.com/b4b4r07/zplug) and [pure theme](https://github.com/sindresorhus/pure/)
* Terminal.app with [Tomorrow theme](https://github.com/chriskempson/tomorrow-theme)
* [Maid](https://github.com/benjaminoakes/maid) with a cron job for automatic file cleaning
* [Pass](http://www.passwordstore.org/) for storing my passwords with a cron job to sync to my server
* Sublime Text settings

## Installation
Make sure you have the Xcode Command Line Tools installed `xcode-select --install`

Clone the repo and run `./bootstrap.sh`
```
$ git clone https://github.com/torrottum/dotfiles
$ cd dotfiles
$ ./bootsrap.sh
```

This will do the following things:
* Symlink the dotfiles and configs into `$HOME`
* Run the scripts inside the `init/` folder
	* **00-cron.sh** will replace the crontab with '.crontab'
	* **00-zsh.sh** will change the default shell to zsh and install [zplug](https://github.com/b4b4r07/zplug)
	* **10-homebrew.sh** will install homebrew
	* **20-terminal.sh** will import and set the `init/misc/terminal.terminal` profile as the default one
	* **30-osx.sh** will run `.osx`
	* **30-ruby.sh** will install rvm
	* **40-apps.sh** will run `.brew`, `.cask`, `.node` and `.gem`

### Updating
Run ```make update```

## Credits
* [Mathias Bynens](https://github.com/mathiasbynens) and his [dotfiles](https://github.com/mathiasbynens/dotfiles) for .osx (mine is customized)
