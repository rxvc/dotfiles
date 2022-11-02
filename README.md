# Configuration Files

## Installation

Remember to symlink the config files and directories:

- `ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf`
- `ln -s ~/.dotfiles/zshrc ~/.zshrc`
- `ln -s ~/.dotfiles/vim ~/.vim`
- `ln -s ~/.dotfiles/vim/vimrc ~/.vimrc`
- `ln -s ~/.dotfiles/gitconfig ~/.gitconfig`
- `ln -s ~/.dotfiles/vim/gvimrc ~/.vgimrc`
- `ln -s ~/.dotfiles/emacs.d ~/.emacs.d`

If your using MacOS to use zsh as default bash:
`sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh`

`which zsh`

`dscl . -read /Users/$USER UserShell`

Install sdkman to manage java version:

`curl -s "https://get.sdkman.io" | bash`


if you want to install space vim go to the following link:

`https://spacevim.org/quick-start-guide/`

