" Bundle
" Non compatible with vi
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'shime/vim-livedown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" End of the vundle settings
call vundle#end()            " required
filetype plugin indent on    " required

" Misc

if has("gui_running")
  " Maximize gvim window (on my screen)
  set lines=40 columns=150
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif

" Edit various files without saving or undoing
set hidden

" System clipboard
set clipboard=unnamedplus

" Misc
set noerrorbells        " don't beep
set noshowmode          " dont show current mode down the bottom
set nowrap              " don't warp lines
set number              " show line numbe
set showcmd             " show incomplete cmds down the bottom
set showmatch           " Show matching brackets when text indicator is over them
set so=5                " Dont go to the edges when moving vertically
set virtualedit=block
set wildmenu            " Enable tab
set lazyredraw
syntax on               " enable syntax

set timeoutlen=500
set ttimeoutlen=100

" Colorscheme
let g:jellybeans_overrides = {
\ 'Cursor': { 'guibg': 'ff00ee', 'guifg': 'ffffff' },
\ 'Search': { 'guifg': '00dddd', 'attr': 'underline' },
\}
colorscheme jellybeans

" Dont backup files
set nobackup
set noswapfile

" Status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2 " Allways show status line

" Searching configs
set hlsearch            " Highlight search
set ignorecase          " Ignore case
set incsearch           " Start searching incremental
set smartcase           " unless it has caps
set magic               " Magic REGEX

" Show $ with 'cw' and similar commands
set cpoptions+=$

" Tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set smartindent

" Filetypes
" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable

augroup filetype
 au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
 au BufRead,BufNewFile *.cup             set filetype=cup
 au BufRead,BufNewFile *.pl              set filetype=prolog
augroup END

au Syntax jflex so ~/.vim/syntax/jflex.vim
au Syntax cup so ~/.vim/syntax/cup.vim
au FileType html setlocal softtabstop=2 shiftwidth=2 tabstop=2
au FileType markdown setlocal softtabstop=2 shiftwidth=2 tabstop=2
au FileType ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2

" Color lines over 80
highlight MyLineTooLongMarker ctermbg=DarkRed guibg=DarkRed
call matchadd('MyLineTooLongMarker', '\%81v', 100)

" Maps --------------------------------------------------

" Leader is <space>
nnoremap <space> <nop>
vnoremap <space> <nop>
let mapleader="\<space>"

" Edit vimrc and source vimrc
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:AirlineRefresh<cr>

" Toggle paste mode
nmap <silent> <F2> :set paste!<cr>
set pastetoggle=<F2>

" Comand line bindings
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
cnoremap jj <esc>

" Toggle hlsearch
nnoremap <silent> <leader><cr> :set hlsearch!<cr>
nnoremap <silent> <cr><leader> :set hlsearch!<cr>

" Fix Y weird behaivour
nnoremap Y y$

" Open and close folds with <space>
nnoremap <leader><leader> za

" Toggle line wrap
nnoremap <leader>lw :set wrap!<cr>

" Quick save and quit
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" Exit insert mode
inoremap jj <ESC>

" Exit visual mode
vnoremap <leader><leader> <ESC>

" Select pasted text
noremap gV `[V+`]

" Stop popping up window
noremap q: :q

" Buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>bd :bd<cr>

" Change 0 to act like ^
nnoremap H ^
nnoremap L $

" Virtual lines are real lines
nnoremap j gj
nnoremap k gk

" Change pane with C-[hjkl]
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


" Plugin Config

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1

" CtrlP
nnoremap <leader>o :CtrlP<cr>

" Instant Markdown
let g:instant_markdown_autostart = 0

" NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" EasyTag
set tags=./tags;
let g:easytags_dynamic_files = 2
