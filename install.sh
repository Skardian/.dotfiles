#!/usr/bin/env sh

# Files included
DOT_DIR="$HOME/.dotfiles"
FILES="Xmodmap alias bashrc commonrc gemrc gitconfig gitignore i3 tmux.conf vim vimrc vrapperrc zshrc"

# Link dotfiles
for f in $FILES; do
    FILE="$HOME/.$f"
    ln -sf $DOT_DIR/$f $FILE;
done

# Install hack font
./dot_bin/update_hack_font.sh

# Get vim-plug and install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
