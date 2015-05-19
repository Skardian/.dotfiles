#!/usr/bin/env sh

# Files included
FILES=".alias .bashrc .fonts .gitconfig .tmux.conf .vim .vimrc .vrapper .zshrc"

mkdir -p ~/.dotfiles/.old

for f in $FILES; do
    # Link to the corresponding file
    ln -sf ~/.dotfiles/$f ~/$f
done

# Clone Vundle and install vim scripts
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qa

