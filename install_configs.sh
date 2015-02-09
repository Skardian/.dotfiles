mv ~/.bashrc  .old/.bashrc
mv ~/.vimrc .old/.vimrc
mv ~/.gitconfig .old/.gitconfig
mv ~/.vim .old/vim

ln -sf ~/configs/.bashrc ~/.bashrc
ln -sf ~/configs/.vimrc ~/.vimrc
ln -sf ~/configs/.gitconfig ~/.gitconfig
ln -sf ~/configs/.vim ~/.vim

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
