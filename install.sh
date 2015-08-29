#!/usr/bin/env sh

# Files included
FILES="alias bashrc commonrc gitconfig gitignore tmux.conf vimrc vrapperrc Xmodmap zshrc"
for f in $FILES; do
    # Link to the corresponding file
    ln -sf ~/.dotfiles/$f ~/.$f
done

# Files included
FOLDERS="fonts vim"
ln -sf ~/.dotfiles/fonts ~/.fonts
ln -sf ~/.dotfiles/vim ~/.vim

# Get vim-plug and install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall

