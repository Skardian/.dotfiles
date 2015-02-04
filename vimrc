" Non compatible with vi "
set nocompatible

" Edit various files without saving or undoing "
"set hidden

" Misc "
set nowrap               " don't warp lines
set number               " show line numbe
syntax on                " enable syntax
set title                " change the terminal's title
set noerrorbells         " don't beep
set pastetoggle=<F2>     " F2 to paste large amounts of text
set wildmenu             " Enable tab
set showcmd              " show incomplete cmds down the bottom
set showmode             " show current mode down the bottom

" If has 256 colors run custom scheme "
if &t_Co >= 256 || has("gui_running")
    colorscheme badwolf
else
    colorscheme default
endif



set showmatch " Show matching brackets when text indicator is over them

" Dont backup files "
set nobackup
set noswapfile

" Status line "
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2 " Allways show status line

" Leader is , "
let mapleader=","

" Searching configs "
set ignorecase          " Ignore case
set smartcase           " unless it has caps
"set gdefault            " default global
set incsearch           " Start searching incremental
set hlsearch            " Highlight search
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Show $ with 'cw' and similar commands "
set cpoptions=ces$

""""""""
" Maps " 
""""""""

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
