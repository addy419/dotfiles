# Dotfiles

#### Arch Linux
```bash
$ sudo pacman -Syy
$ sudo pacman -S nodejs xclip npm yarn python python-pip ripgrep kitty kitty-terminfo neovim
$ pamac build rcm
```

#### Configuration
```bash
$ git clone git@github.com:addy419/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ sh install.sh
$ RCRC=./rcrc rcup -v -t nvim #For NeoVim
```

```bash
- nvim # Node Yarn Python Ripgrep Neovim
- kitty # Python
- gestures # LibInputs
```
