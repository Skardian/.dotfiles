mv ~/.bashrc  .old/.bashrc
mv ~/.vimrc .old/.vimrc
mv ~/.gitconfig .old/.gitconfig
mv ~/.vim .old/vim

ln -sf ./.bashrc ~/.bashrc
ln -sf ./.vimrc ~/.vimrc
ln -sf ./.gitconfig ~/.gitconfig
ln -sf ./.vim ~/.vim
