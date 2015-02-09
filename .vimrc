" Non compatible with vi
set nocompatible

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat.git'

" End of the vundle settings
call vundle#end()            " required
filetype plugin indent on    " required

" Edit various files without saving or undoing
set hidden

" Misc
set nowrap               " don't warp lines
set number               " show line numbe
syntax on                " enable syntax
set title                " change the terminal's title
set noerrorbells         " don't beep
set wildmenu             " Enable tab
set showcmd              " show incomplete cmds down the bottom
set showmode             " show current mode down the bottom

" If has 256 colors run custom scheme
if &t_Co >= 256 || has("gui_running")
    colorscheme jellybeans
else
    colorscheme default
endif



set showmatch " Show matching brackets when text indicator is over them

" Dont backup files
set nobackup
set noswapfile

" Status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2 " Allways show status line

" Leader is ,
let mapleader=","

" Searching configs
set ignorecase          " Ignore case
set smartcase           " unless it has caps
set incsearch           " Start searching incremental
set hlsearch            " Highlight search
nnoremap <leader><leader> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Show $ with 'cw' and similar commands
set cpoptions=ces$

"""""""""""""
" Filetypes "
"""""""""""""
" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable

augroup filetype
  au BufRead,BufNewFile *.flex,*.jflex,*.cup    set filetype=jflex
"  au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
"  au BufRead,BufNewFile *.cup             set filetype=cup
augroup END
au Syntax jflex so ~/.vim/syntax/jflex.vim
"au Syntax cup so ~/.vim/syntax/cup.vim

""""""""
" Maps " 
""""""""

" Edit vimrc and source vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

" Move from frame to frame
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Force myself to use hjkl
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
