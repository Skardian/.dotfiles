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

# Clone Vundle and install vim scripts
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qa

