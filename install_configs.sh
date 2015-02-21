mkdir -p ~/.dotfiles/.old

mv -f ~/.bashrc  .old/.bashrc
mv -f ~/.vimrc .old/.vimrc
mv -f ~/.gitconfig .old/.gitconfig
mv -f ~/.vim .old/.vim
mv -f ~/.alias .old/.alias

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.vim ~/.vim
ln -sf ~/.dotfiles/.alias ~/.alias

# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
