" Non compatible with vi
set nocompatible

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'honza/vim-snippets'
Plugin 'matchit.zip'
Plugin 'scrooloose/nerdtree'
Plugin 'sirver/ultisnips'       " Snippets
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" Ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" End of the vundle settings
call vundle#end()            " required
filetype plugin indent on    " required

" Edit various files without saving or undoing
set hidden

" Misc
set noerrorbells        " don't beep
set noshowmode          " dont show current mode down the bottom
set nowrap              " don't warp lines
set number              " show line numbe
set showcmd             " show incomplete cmds down the bottom
set so=5                " Dont go to the edges when moving vertically
set virtualedit=block
set wildmenu            " Enable tab
syntax on               " enable syntax

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
set hlsearch            " Highlight search
set ignorecase          " Ignore case
set incsearch           " Start searching incremental
set smartcase           " unless it has caps
nnoremap <silent> <leader><CR> :set hlsearch!<cr>
nnoremap <silent> <CR><leader> :set hlsearch!<cr>

" Show $ with 'cw' and similar commands
set cpoptions=ces$

" Tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

"""""""""""""
" Filetypes "
"""""""""""""
" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable

augroup filetype
  " au BufRead,BufNewFile *.flex,*.jflex,*.cup    set filetype=jflex
 au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
 au BufRead,BufNewFile *.cup             set filetype=cup
augroup END
au Syntax jflex so ~/.vim/syntax/jflex.vim
au Syntax cup so ~/.vim/syntax/cup.vim
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

""""""""
" Maps " 
""""""""
" Edit vimrc and source vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quick save
nnoremap <leader>w :w!<cr>

" Exit insert mode
inoremap jj <ESC>

" Toggle wrap
nnoremap <silent> <leader>lw :set wrap!<CR>

" Split line
nnoremap K hf<space>r<CR>

" Buffers
nnoremap <leader>bd :bd<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>ls :ls<cr>

" Move from frame to frame
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

""""""""""""""
"  NERDTree  "
""""""""""""""
nnoremap <leader>t :NERDTreeToggle<cr>

"""""""""""""
" UltiSnips "
"""""""""""""
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""
"  Airline  "
"""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1

