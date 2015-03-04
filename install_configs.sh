mkdir -p ~/.dotfiles/.old

mv -f ~/.bashrc  .old/.bashrc
mv -f ~/.vimrc .old/.vimrc
mv -f ~/.gitconfig .old/.gitconfig
mv -f ~/.vim .old/.vim
mv -f ~/.alias .old/.alias
mv -f ~/.fonts .old/.fonts
mv -f ~/.tmux.conf .old/.tmux.conf

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.vim ~/.vim
ln -sf ~/.dotfiles/.alias ~/.alias
ln -sf ~/.dotfiles/.fonts ~/.fonts
ln -sf ~/.tmux.conf ~/.tmux.conf

# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
