#!/usr/bin/env sh

# Files included
FILES="alias bashrc gitconfig gitignore tmux.conf vimrc vrapperrc zshrc"
for f in $FILES; do
    # Link to the corresponding file
    ln -sf ~/.dotfiles/$f ~/.$f
done

# Files included
FOLDERS="fonts vim"
for f in $FOLDERS; do
    # Link to the corresponding file
    ln -sf ~/.dotfiles/$f/ ~/$f/
done

# Clone Vundle and install vim scripts
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qa

