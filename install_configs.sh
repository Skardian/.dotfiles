mkdir -p ~/.dotfiles/.old

mv ~/.bashrc  .old/.bashrc
mv ~/.vimrc .old/.vimrc
mv ~/.gitconfig .old/.gitconfig
mv ~/.vim .old/vim

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.vim ~/.vim

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
