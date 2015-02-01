" Non compatible with vi "
set nocompatible

" Leader is , "
let mapleader=","

" Maps "
    " Edit vimrc and source vimrc "
    nnoremap <leader>ev :split $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    " Surround with "
    nnoremap <leader>s" viw<esc>a"<esc>hbi"<esc>lel

" test

" Tab settings "
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Force myself to use hjkl "
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
