# Dotfiles

#### Arch Linux
```bash
$ sudo pacman -Syy
$ sudo pacman -S nodejs npm yarn python python-pip ripgrep kitty kitty-terminfo
$ pamac build rcm
```

#### Linux
- [Node](https://nodejs.org/en/download/package-manager/)
- [Yarn](https://classic.yarnpkg.com/en/docs/install/)
- [Python](https://www.python.org/downloads/) >= 3.6.1
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Rcm](https://github.com/thoughtbot/rcm)

#### Configuration
```bash
$ git clone git@github.com:addy419/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ sh install.sh
$ RCRC=./rcrc rcup -v
```
