#!/usr/bin/env sh

# Files included
DOT_DIR="$HOME/.dotfiles"
DOT_FILES="Xmodmap alias bashrc commonrc gemrc gitconfig gitignore tmux.conf vim vimrc vrapperrc zshrc"

# Install dotfiles
for f in $DOT_FILES; do
    FILE="$HOME/.$f"
    # Backup old file
    [ -e $FILE ] && { diff $DOT_DIR/$f $FILE &> /dev/null || { echo "Backup $FILE as $FILE.old"; mv $FILE $FILE.old; } }
    ln -sf $DOT_DIR/$f $FILE;
done

# Install bin
for b in bin/*; do
    FILE="$HOME/$b"
    # Backup old file
    [ -e $FILE ] &&  { diff $DOT_DIR/$b $FILE &> /dev/null || { echo "Backup $FILE as $FILE.old"; mv $FILE $FILE.old; } }
    ln -sf $DOT_DIR/$b $FILE
done

# Install hack font
./dot_bin/update_hack_font.sh

# Get vim-plug and install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall

