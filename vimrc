" Non compatible with vi "
set nocompatible

" Edit various files without saving or undoing "
set hidden

" Misc "
set nowrap " don't warp lines
set number " show line numbe
syntax on
set title                " change the terminal's title
set noerrorbells         " don't beep
set pastetoggle=<F2>     " F2 to paste large amounts of text

" Dont backup files "
set nobackup
set noswapfile

" Status line "
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2 " Allways show status line

" Leader is , "
let mapleader=","

" Maps "
    " Edit vimrc and source vimrc "
    nnoremap <leader>ev :split $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>

    " Move from frame to frame
    nnoremap <c-h> <c-w>h
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l

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
